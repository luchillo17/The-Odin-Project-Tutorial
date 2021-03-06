class User < ActiveRecord::Base

	default_scope { order('created_at ASC') }

	attr_accessor :remember_token

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	validates :name,	presence: true,
										length: { maximum: 50 }
	validates :email,	presence: true,
										uniqueness: { case_sensitive: false},
										length: { maximum: 255 },
										format: { with: VALID_EMAIL_REGEX }
	validates :password,	presence: true,
												length: { minimum: 6 },
												allow_nil: true

	has_secure_password

	before_save{ self.email.downcase! }

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		self.remember_token = User.new_token()
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	def forget
		update_attribute(:remember_digest, nil)
	end

	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	def save(*args)
		super
	rescue ActiveRecord::RecordNotUnique => error
		errors[:base] << error.message.match(/DETAIL:(.*)\./).to_s
		false
	end
end
