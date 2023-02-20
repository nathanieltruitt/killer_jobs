class JobsController < ApplicationController
  before_action :authenticate_employer!, only: %i[new create edit update destroy]
  before_action :set_job, only: %i[show edit update destroy]

  def index
    # TODO: build pagination
    @jobs = Job.paginate(params[:page])
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.company = current_user.company
    if @job.save
      redirect_to @job
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path, notice: 'Job was successfully deleted.'
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def authenticate_employer!
    authenticate_user!

    unless current_user.role.name == 'employer'
      redirect_to root_path, alert: 'You must be an employer to access this page.'
    end
  end
end