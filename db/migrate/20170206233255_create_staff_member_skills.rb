class CreateStaffMemberSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :staff_member_skills do |t|
      t.belongs_to :staff_member, index: true
      t.belongs_to :skill, index: true

      t.timestamps
    end
  end
end
