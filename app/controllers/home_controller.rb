class HomeController < ApplicationController
  def index
  	@user = current_user
  	@ships = Ship.where(user_id: @user.id)
  	@ship = Ship.new
    @this_ship = Ship.find_by(user_id: @user.id)
  end

  def home
  	if current_user
  		@user = current_user
    else
      @user = User.new
  	end
  end
  
end
