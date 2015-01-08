class CreateProductProperties < ActiveRecord::Migration
  def change
    create_table :product_properties do |t|
      t.string :building_area
      t.string :surface_area
      t.string :bathroom
      t.string :bedroom
      t.string :certificate
      t.string :interior
      t.string :electrical_power
      t.string :birth_year

      t.timestamps
    end
  end
end
