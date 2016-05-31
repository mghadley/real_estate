class HomesController < ApplicationController
  before_action :seller_instance, except: [:search, :search_results]
  before_action :home_instance, only: [:show, :edit, :update, :destroy]

  def index
    @homes = Home.all_homes
  end

  def show
  end

  def search
  end

  def search_results
    @homes = Home.search_results(search_params)
    render :search_results
  end

  def new
    @home = Home.new
  end

  def create
    @home = @seller.homes.new(home_params)
    if @home.save
      flash[:success] = 'Home created successfully'
      redirect_to seller_home_path(@seller, @home)
    else
      flash.now[:danger] = @home.errors.full_messages.join('<br/>').html_safe
      render :new, layout: true
    end
  end

  def edit
  end

  def update
    if @home.update(home_params)
      flash[:success] = 'Home updated successfully'
      redirect_to seller_home_path(@seller, @home)
    else
      flash.now[:danger] = @home.errors.full_messages.join('<br/>').html_safe
      render :update
    end
  end

  def destroy
    @home.destroy
    flash[:success] = "Home Deleted"
    redirect_to seller_homes_path(@seller)
  end

  private

  def home_params
    params.require(:home).permit(:title, :description, :sq_ft, :floors, :price, :sold, :disliked)
  end

  def search_params
    params.permit(:min_sq_ft, :max_sq_ft, :floors, :min_price, :max_price)
  end

  def home_instance
    @home = @seller.homes.find(params[:id])
  end

  def seller_instance
    @seller = Seller.find(params[:seller_id])
  end

end
