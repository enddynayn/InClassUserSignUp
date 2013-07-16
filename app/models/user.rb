class User < ActiveRecord::Base
	before_save :encrypt_password

	validates :password, confirmation: true
	validates :password_confirmation, presence: true

	def self.authenticate(email, password)
		user = User.find_by(email: email)

		if user
			fish = BCrypt::Engine.hash_secret(password, user.salt)
			if user.fish == fish
				return user 
		
			end
		end
			nil
	end

	def password
		@password
	end

	def password=(new_pasword)
		@password = new_pasword
	end
	
	def password_confirmation
		@password_confirmation
	end

	def password_confirmation=(new_pasword)
		@password_confirmation = new_pasword
	end

	private

	def encrypt_password
		self.salt = BCrypt::Engine.generate_salt
		self.fish = BCrypt::Engine.hash_secret(password, self.salt)
	end
end




# def salt
# 	#get from db
# end

# def salt=(new_salt)
# 	#save to db
# end