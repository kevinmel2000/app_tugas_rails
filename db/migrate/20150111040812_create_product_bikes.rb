class CreateProductBikes < ActiveRecord::Migration
  def change
    create_table :bike_properties do |t|
      t.string :brand
      t.string :color
      t.string :manufacture
      t.string :condition
      t.string :bike_type

      t.timestamps
    end
  end
end
