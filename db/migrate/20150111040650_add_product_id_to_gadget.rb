class AddProductIdToGadget < ActiveRecord::Migration
  def change
  	add_column :gadgets, :product_id, :integer
  end
end
