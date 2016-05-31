class StaticPagesController < ApplicationController
	before_action :authorize

  def welcome
  end

  def profile
  	@user = current_user
  end
end
