class Post < ActiveRecord::Base
	belongs_to :user

	before_save{ self.title.capitalize! }

	validates :title, presence: true,
										uniqueness: {case_sensitive: false},
										length: {minimum: 5, maximum: 255}
	validates :body,	presence: true,
										length: {minimum: 5, maximum: 255}

	def save(*args)
		super
	rescue ActiveRecord::RecordNotUnique => error
		errors[:base] << error.message.match(/DETAIL:(.*)\./).to_s
		false
	end
end
