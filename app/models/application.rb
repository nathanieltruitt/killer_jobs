class Application < ApplicationRecord
  belongs_to :user
  belongs_to :job
  validates :user_id, :job_id, presence: true
end
