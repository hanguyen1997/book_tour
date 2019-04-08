class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :description_detail, foreign_key: true
      t.integer :status
      t.float :price
      t.integer :quantity
      t.timestamps
    end
  end
end
