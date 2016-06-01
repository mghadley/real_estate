class DislikesController < ApplicationController
	def create
		if current_user.dislikes.create(dislike_params)
			flash[:success] = "'#{Home.find(dislike_params[:home_id]).title}' will no longer appear in your searches"
		else
			flash[:danger] = "Something went wrong :/"
		end
		redirect_to profile_path
	end

	private

	def dislike_params
		params.require(:dislike).permit(:home_id)
	end
end
