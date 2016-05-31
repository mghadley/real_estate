class Seller < ActiveRecord::Base
	has_many :homes

	def home_count
		self.homes.count
	end
end
