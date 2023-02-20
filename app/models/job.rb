class Job < ApplicationRecord
  belongs_to :company
  has_many :applications
  has_many :users, through: :applications
  validates :title, :description, :company_id, presence: true

  def self.paginate(page)
    page = 1 if page.nil?
    offset((page.to_i - 1) * 10).limit(10)
  end

  def has_applicant?(user_id)
    Application.where(user_id: user_id).count.positive?
  end
end

