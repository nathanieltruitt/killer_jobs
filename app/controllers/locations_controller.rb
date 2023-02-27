class LocationsController < ApplicationController
  include LocationsHelper
  before_action :set_location, only: %i[show edit update destroy]
  before_action :set_company
  before_action :authenticate_company_admin!, only: %i[new create edit update destroy]

  def show
  end

  def new
    @location = @company.locations.new
  end

  def edit
  end

  def create
    @location = @company.locations.new(location_params)
    if @location.save
      redirect_to @location, notice: 'Location was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @location.update(location_params)
      redirect_to @location, notice: 'Location was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @location.primary_location == false
      @location.destroy
      redirect_to my_company_path, notice: 'Location was successfully deleted.'
    else
      redirect_to my_company_locations_path, notice: 'Primary location cannot be deleted.'
    end
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def location_params
    params.require(:location).permit(:address, :city, :state, :zip_code, :company_id, :primary_location)
  end
end