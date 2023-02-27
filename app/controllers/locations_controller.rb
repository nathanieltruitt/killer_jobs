class LocationsController < ApplicationController
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
    @location.destroy
    redirect_to locations_path, notice: 'Location was successfully deleted.'
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