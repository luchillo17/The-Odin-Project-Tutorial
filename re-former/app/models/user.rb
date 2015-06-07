class User < ActiveRecord::Base

	validates :username, presence: true
	validates :email, presence: true, uniqueness: {case_sensitive: false}
	validates :password, presence: true

	before_save{ self.username.downcase! && self.email.downcase! }

	def save(*args)
		super
	rescue ActiveRecord::RecordNotUnique => error
		errors[:base] << error.message.match(/DETAIL:(.*)\./).to_s
		false
	end
end
