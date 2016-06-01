class UsersController < ApplicationController
	before_action :user_instance, only: [:show, :update, :destroy]

  def index
  	@users = User.all
  end

  def show
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      session[:user_id] = @user.id
  		flash[:success] = "Welcome, #{@user.name}"
  		redirect_to profile_path
  	else
  		flash[:danger] = @user.errors.full_messages.join('<br/>').html_safe
  		render :new
  	end
  end

  def edit
    @user = current_user
  end

  def update
  	if @user.update(user_params)
  		flash[:success] = 'Information Updated Successfully'
  		redirect_to profile_path
  	else
  		flash[:danger] = @user.errors.full_messages.join('<br/>').html_safe
  	end
  end

  def destroy
  	@user.destroy
  	flash[:success] = 'User Deleted'
  	redirect_to users_path
  end

  private

  def user_params
  	params.require(:user).permit(:name, :phone_number, :email, :password, :password_confirmation, :favorites, :dislikes)
  end

  def user_instance
  	@user = User.find(params[:id])
  end

end
