class Company < ApplicationRecord
  has_many :users
  has_many :jobs
  has_many :locations
  accepts_nested_attributes_for :locations, :users
  validates :name, presence: true
end
