class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.float :rating
      t.string :image
      t.string :itinerary
      t.text :content

      t.timestamps
    end
  end
end
