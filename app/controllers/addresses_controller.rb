class AddressesController < ApplicationController
	before_action :address_instance, only: [:show, :edit, :update, :destroy]
	before_action :home_instance, only: [:update, :show]
	before_action :user_instance, only: [:update, :show]

  def index
  	@addresses = Address.all
  end

  def show
  end

  def new
  	@home = Home.find(params[:home_id])
  	@address = Address.new
  end

  def create
  	@address = Address.new(address_params)
  	binding
  	@home = Home.find(@address.home_id)
  	@user = User.find(@home.user_id)
  	if @address.save
  		redirect_to user_home_path(@user, @home)
  	else
  		flash[:danger] = @home.errors.full_messages.join('<br>').html_safe
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @address.update(address_params)
  		flash[:success] = "Address updated successfully"
  		redirect_to address_path(@address)
  	else
  		flash.now[:danger] = @home.errors.full_messages.join('<br>').html_safe
  		render :edit
  	end
  end

  def destroy
  	@home = Home.find(@address.home_id)
  	@user = User.find(@home.user_id)
  	@address.destroy
  	flash[:success] = "Address deleted"
  	redirect_to user_home_path(@user, @home)
  end

  private

  def address_params
  	params.require(:address).permit(:street, :street2, :city, :state, :zip, :home_id)
  end

  def address_instance
  	@address = Address.find(params[:id])
  end

  def home_instance
  	@home = Home.find(@address.home_id)
  end

  def user_instance
  	@user = User.find(@home.user_id)
  end
end



