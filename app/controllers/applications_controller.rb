# frozen_string_literal: true
class ApplicationsController < ApplicationController
  before_action :authenticate_applicant!

  def create
    @job = Job.find(params[:job_id])
    @job.applications.create(user: current_user)
    redirect_to jobs_path, notice: 'Successfully applied for job.'
  end

  def destroy
    Application.find_by(job_id: params[:job_id], user_id: current_user.id).destroy
    redirect_to jobs_path, notice: 'Successfully cancelled application.'
  end

  private

  def authenticate_applicant!
    authenticate_user!

    if current_user.role.name != 'applicant'
      redirect_to root_path, alert: 'Employers cannot apply for jobs.'
    end
  end
end