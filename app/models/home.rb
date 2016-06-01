class Home < ActiveRecord::Base
	belongs_to :user
	has_one :address
	validates_presence_of :title
	validates :floors, :sq_ft, numericality: { greater_than: 0 }
	validates :price, numericality: { greater_than_or_equal_to: 0 } 

	def self.all_homes
		Home.all.order(:sold)
	end

	def self.floor_range
		Home.pluck('DISTINCT floors').sort
	end

	def self.remove_dislikes(homes, current_user)
		dislikes_arr = Dislike.where(user_id: current_user.id).pluck(:home_id)
		return homes.delete_if {|home| dislikes_arr.include?(home.id)}
	end

	def self.search_results(search_params, current_user)
		search_params[:min_sq_ft].empty? ? min_sq_ft = 0 : min_sq_ft = search_params[:min_sq_ft]
		search_params[:max_sq_ft].empty? ? max_sq_ft = 9999999 : max_sq_ft = search_params[:max_sq_ft]
		search_params[:min_price].empty? ? min_price = 0 : min_price = search_params[:min_price]
		search_params[:max_price].empty? ? max_price = 999999999 : max_price = search_params[:max_price]
		floors = search_params[:floors]
		results = Home.where(:sq_ft => min_sq_ft.to_i..max_sq_ft.to_i, :price => min_price.to_i..max_price.to_i, 
			                :floors => floors.to_i, :disliked => false).where.not(:user_id => current_user.id).order(:sold)
		return Home.remove_dislikes(results.to_a, current_user)
	end

	private 

end

