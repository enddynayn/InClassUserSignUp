class User < ActiveRecord::Base
	before_save :encrypt_password

	attr_accessor :password, :password_confirmation

	validates :password, confirmation: true
	validates :password_confirmation, presence: true
	

	private

	def encrypt_password
		self.salt = BCrypt::Engine.generate_salt
		self.fish = BCrypt::Engine.hash_secret(password, self.salt)
	end
end
