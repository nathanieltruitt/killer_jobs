class ApplicationsController < ApplicationController
  before_action :authenticate_applicant!

  def create
    @job = Job.find(params[:job_id])
    @job.applications.create(user: current_user)
  end

  def destroy
    Application.find_by(job_id: params[:job_id], user_id: current_user.id).destroy
    redirect_to jobs_path, notice: 'Application was successfully deleted.'
  end

  private

  def authenticate_applicant!
    authenticate_user!

    if current_user.role.name != 'Applicant'
      redirect_to root_path, alert: 'Employers cannot apply for jobs.'
    end
  end
end