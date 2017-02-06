class StaffMember < ApplicationRecord
  belongs_to :user
  belongs_to :role

  has_many :staff_member_skills
  has_many :skills, through: :staff_member_skills

  validates :pod, presence: true
  validates :started_at_company, presence: true
end
