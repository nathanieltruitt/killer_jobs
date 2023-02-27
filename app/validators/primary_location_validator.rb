class PrimaryLocationValidator < ActiveModel::Validator
  def validate(record)
    return unless record.primary_location

    record.errors.add :primary_location, 'already exists' if primary_location_exists?(record.company)
  end

  private

  def primary_location_exists?(company)
    company.locations.where(primary_location: true).count == 1
  end
end