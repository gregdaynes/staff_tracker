class StaffMember < ApplicationRecord
  validates :first_name, presence: true,
                         length: { minimum: 2 } # short names, like Al, Ed
end
