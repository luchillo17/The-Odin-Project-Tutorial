class User < ActiveRecord::Base

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	validates :name,	presence: true,
										length: {maximum: 50}
	validates :email, presence:true,
										uniqueness: {case_sensitive: false},
										length: {maximum: 255},
										format: {with: VALID_EMAIL_REGEX}
	validates :password,	presence: true,
												length: {minimum: 6}

	has_secure_password
	 
	before_save{ self.email.downcase! }

	def save(*args)
		super
	rescue ActiveRecord::RecordNotUnique => error
		errors[:base] << error.message.match(/DETAIL:(.*)\./).to_s
		false
	end
end
