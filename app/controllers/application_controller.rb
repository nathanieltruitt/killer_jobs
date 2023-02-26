# frozen_string_literal: true
class ApplicationController < ActionController::Base

  private

  def authenticate_employer!
    # here we are authenticating both employer and company_admin as company_admin is a type of employer
    authenticate_user!

    unless current_user.role.name == 'employer' || current_user.role.name == 'company_admin'
      redirect_to root_path, alert: 'You must be an employer to access this page.'
    end
  end

  def authenticate_company_admin!
    authenticate_user!

    unless current_user.role.name == 'company_admin'
      redirect_to root_path, alert: 'You must be a company admin to access this page.'
    end
  end
end
