class AddDetailsToStaffMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :staff_members, :pod, :integer
    add_column :staff_members, :started_at_company, :date
    add_reference :staff_members, :user, foreign_key: true
  end
end
