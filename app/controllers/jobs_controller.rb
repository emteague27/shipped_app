class JobsController < ApplicationController
  def index
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)
    if @job.save
      redirect_to home_index_path
    else
      flash[:notice] = "Please make sure your job name has not been used and Try Again."
      redirect_to :back
    end
  end

  def edit
    @job = Job.find(params[:id])
    @ship = Ship.find_by(params[:ship_id])
  end

  def update
    @job = Job.find(params[:id])
     if @job.update(job_params)
      redirect_to home_index_path
    else
      flash[:notice] = "something went wrong please try again"
      redirect_to :back
    end
  end

  def show
    @job = Job.where(ship_id: params[:ship_id])
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.delete
      redirect_to home_index_path
    else
      redirect_to :back
    end
  end

  private
  def job_params
    params.require(:job).permit(:job_name, :cargo, :containers_needed, :ship_id, :destination, :current_location, :cost, :ship_name)
  end
end
