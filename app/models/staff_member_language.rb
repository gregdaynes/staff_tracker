class StaffMemberLanguage < ApplicationRecord
  belongs_to :staff_member
  belongs_to :language
end
