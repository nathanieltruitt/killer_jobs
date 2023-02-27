# this controller is used for company admins to make changes to their companies
class MyCompanyController < ApplicationController
  before_action :authenticate_company_admin!
  before_action :set_company

  def show
  end

  def recruiters
    @recruiters = @company.users.where(role_id: 2)
  end

  def locations
    @locations = @company.locations
  end

  private 

  def set_company
    @company = current_user.company
  end
end