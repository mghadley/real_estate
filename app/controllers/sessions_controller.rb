class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		flash[:success] = "Log in successful"
  		redirect_to profile_path
  	else
      flash[:danger] = 'Email and/or password incorrect'
  		redirect_to '/login'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end
end
