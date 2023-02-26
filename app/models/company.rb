class Company < ApplicationRecord
  has_many :users
  has_many :jobs
  has_many :locations
  validates :name, presence: true
end
