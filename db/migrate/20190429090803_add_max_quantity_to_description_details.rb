class AddMaxQuantityToDescriptionDetails < ActiveRecord::Migration[5.2]
  def change
  	 add_column :description_details, :max_quantity, :integer
  end
end
