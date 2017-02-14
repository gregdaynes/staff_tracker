class CreatePresentations < ActiveRecord::Migration[5.0]
  def change
    create_table :presentations do |t|
      t.string :title
      t.binary :content
      t.date :date_of_presentation

      t.timestamps
    end
  end
end
