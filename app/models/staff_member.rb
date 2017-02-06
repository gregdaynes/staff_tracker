class StaffMember < ApplicationRecord
  belongs_to :user

  validates :pod, presence: true
  validates :started_at_company, presence: true
end
