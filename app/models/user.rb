class User < ActiveRecord::Base
	has_many :homes
	validates_uniqueness_of :email
	validates_presence_of :name, :email, :password_digest
	has_secure_password

	def home_count
		self.homes.count
	end
end
