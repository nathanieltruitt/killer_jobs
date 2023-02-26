# frozen_string_literal: true
class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]
  before_action :authenticate_company_admin!, only: %i[edit update destroy]
  before_action :no_current_user?, only: %i[new create]

  # GET /companies
  def index
    @companies = Company.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @companies }
    end
  end

  # GET /companies/1
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
    @company.locations.new
  end

  # GET /companies/1/edit
  def edit
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company, notice: 'Company was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @company.update(company_params)
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_path, notice: 'Company was successfully deleted.'
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, location_attributes: %[address city state zip_code primary_location])
  end

  # Only anonymous users can create new companies. Then they become a company admin.
  def no_current_user?
    return true if current_user.nil?

    false
  end
end
