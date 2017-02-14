class CreatePersonPresentations < ActiveRecord::Migration[5.0]
  def change
    create_table :person_presentations do |t|
      t.belongs_to :person, index: true
      t.belongs_to :presentation, index: true
    end
  end
end
