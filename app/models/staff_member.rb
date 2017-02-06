class StaffMember < ApplicationRecord
  belongs_to :user
  belongs_to :role

  validates :pod, presence: true
  validates :started_at_company, presence: true
end
