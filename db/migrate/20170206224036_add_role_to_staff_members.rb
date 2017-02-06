class AddRoleToStaffMembers < ActiveRecord::Migration[5.0]
  def change
    add_reference :staff_members, :role, foreign_key: true
  end
end
