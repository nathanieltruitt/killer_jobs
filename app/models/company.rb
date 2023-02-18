class Company < ApplicationRecord
  has_many :users
  has_many :jobs
  validates :name, :address, :city, :state, :zip, presence: true
end
