module JobsHelper
  def application_by_job(job)
    (job.applications.select { |application| application.user == current_user }).first
  end

  def pages(jobs)
    (jobs / 10.0).ceil
  end
end