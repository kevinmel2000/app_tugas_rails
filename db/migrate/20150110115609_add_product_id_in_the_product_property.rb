class AddProductIdInTheProductProperty < ActiveRecord::Migration
  def change
  	add_column :product_properties, :product_id, :integer
  end
end
