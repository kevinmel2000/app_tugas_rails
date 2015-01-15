class AddKilometerAndNumberPlateToBikeProperties < ActiveRecord::Migration
  def change
    add_column :bike_properties, :kilometer, :string
    add_column :bike_properties, :number_plate, :string
  end
end
