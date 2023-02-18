class Job < ApplicationRecord
  belongs_to :company
  has_many :applications
  has_many :users, through: :applications
  validates :title, :description, :company_id, presence: true

  def self.paginate(page)
    page = 1 if page.nil?
    offset((page - 1) * 10).limit(10)
  end

  def self.has_applicant?(user_id)
    Applications.where(user_id: user_id).exists?
  end
end
