class StaffMemberSkill < ApplicationRecord
  belongs_to :staff_member
  belongs_to :skill
end
