class AddProductIdInTheCar < ActiveRecord::Migration
  def change
  	add_column :cars, :product_id, :string
  end
end
