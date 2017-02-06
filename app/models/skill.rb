class Skill < ApplicationRecord
  has_many :staff_member_skills
  has_many :staff_members, through: :staff_member_skills

  validates_presence_of :title
end
