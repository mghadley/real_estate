class SellersController < ApplicationController
	before_action :seller_instance, only: [:show, :edit, :update, :destroy]

  def index
  	@sellers = Seller.all
  end

  def show
  end

  def new
  	@seller = Seller.new
  end

  def create
  	@seller = Seller.new(seller_params)
  	if @seller.save
  		flash[:success] = "Welcome, #{@seller.name}"
  		redirect_to seller_path(@seller)
  	else
  		flash[:danger] = @seller.errors.full_messages.join('<br/>').html_safe
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @seller.update(seller_params)
  		flash[:success] = 'Information Updated Successfully'
  		redirect_to seller_path(@seller)
  	else
  		flash[:dnager] = @seller.errors.full_messages.join('<br/>').html_safe
  	end
  end

  def destroy
  	@seller.destroy
  	flash[:success] = 'Seller Deleted'
  	redirect_to sellers_path
  end

  private

  def seller_params
  	params.require(:seller).permit(:name, :phone_number, :email)
  end

  def seller_instance
  	@seller = Seller.find(params[:id])
  end

end
