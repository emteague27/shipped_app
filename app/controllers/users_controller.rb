class UsersController < ApplicationController
  def index
    @user = User.where(params[:id])
    @users = User.all
  end

  def show
    @user = current_user
    @this_user = User.find(params[:id])
    @ships = @this_user.ships
  end

  def new
    @user = User.new
  end

  def create
  @user = User.new(user_params)
  if @user.save
    session[:user_id] = @user.id
    redirect_to home_index_path
  else
    flash[:alert] = "Your account was unable to be created."
    redirect_to new_user_path
  end
  end

  def edit
    @user = current_user
    @user.id = params[:id]
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:notice] = "Updated User"
      redirect_to home_index_path
    else
      flash[:notice] = "Could Not Update Account"
      redirect_to :back
    end
  end

  def destroy
    @user = current_user
    if @user.destroy
      session.clear
      redirect_to root_path
    else
      flash[:notice] = "Account Could Not be Deleted."
      redirect_to home_index_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password, :avatar)
  end
end
