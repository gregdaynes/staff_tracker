class CreateStaffMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :staff_members do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :gender
      t.decimal :height
      t.decimal :weight
      t.date :date_of_birth

      t.timestamps
    end
  end
end
