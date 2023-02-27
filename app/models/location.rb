require_relative '../validators/state_validator.rb'

class Location < ApplicationRecord
  belongs_to :company
  # TODO: need to setup validations
  validates :address, :city, :state, :zip_code, presence: true
  validates :zip_code, numericality: { only_integer: true }, length: { is: 5 }
  validates_with StateValidator

end
