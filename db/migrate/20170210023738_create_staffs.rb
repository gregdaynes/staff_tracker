class CreateStaffs < ActiveRecord::Migration[5.0]
  def change
    create_table :staff do |t|
      t.string :pod
      t.date :started_at_company
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
