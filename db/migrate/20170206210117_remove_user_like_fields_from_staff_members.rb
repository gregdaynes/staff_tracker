class RemoveUserLikeFieldsFromStaffMembers < ActiveRecord::Migration[5.0]
  def change
    remove_column :staff_members, :first_name, :string
    remove_column :staff_members, :middle_name, :string
    remove_column :staff_members, :last_name, :string
    remove_column :staff_members, :gender, :string
    remove_column :staff_members, :height, :decimal
    remove_column :staff_members, :weight, :decimal
    remove_column :staff_members, :date_of_birth, :datetime
  end
end
