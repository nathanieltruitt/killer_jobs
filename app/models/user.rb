class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role
  belongs_to :company, optional: true
  has_many :applications
  has_many :jobs, through: :applications
  validates :email, :role_id, presence: true
end
