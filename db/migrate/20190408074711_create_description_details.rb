class CreateDescriptionDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :description_details do |t|
      t.references :tour, foreign_key: true
      t.float :price
      t.datetime :start_day
      t.datetime :end_day
      
      t.timestamps
    end
  end
end
