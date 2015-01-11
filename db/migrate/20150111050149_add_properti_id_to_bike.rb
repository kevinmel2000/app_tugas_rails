class AddPropertiIdToBike < ActiveRecord::Migration
  def change
  add_column :bike_properties, :product_id, :integer
  end
end
