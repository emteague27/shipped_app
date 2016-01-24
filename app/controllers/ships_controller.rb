class ShipsController < ApplicationController
  def index
    @ships = Ship.all
  end

  def show
    @user = current_user
    @ship = Ship.find(params[:id])
    @ships = @user.ships.all
    @jobs = @ship.jobs
    @job = Job.new

  end

  def new
    @user = current_user
    @ship = @user.ships.build
  end

  def create
    @user = current_user
    @ship = @user.ships.build(ship_params)
    if @ship.save
      redirect_to home_index_path
    else
      flash[:notice] = "Please make sure your boat name is unique and Try Again."
      redirect_to :back
    end
  end

  def edit
    @ship = Ship.find(params[:id])
  end

  def update
    @ship = Ship.find(params[:id])
    if @ship.update(ship_params)
      p @ship.id
      redirect_to home_index_path
    else
      redirect_to :back
    end
  end

  def destroy
    @ship = Ship.find(params[:id])
    if @ship.delete
      redirect_to home_index_path
    else
      redirect_to :back
    end
  end

  private
  def ship_params
    params.require(:ship).permit(:name, :location, :length, :ship_type, :container_no, :avatar)
  end
end
