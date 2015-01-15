class AddTransmissionAndFullTankToBikeProperties < ActiveRecord::Migration
  def change
    add_column :bike_properties, :transmission, :string
    add_column :bike_properties, :full_tank, :string
  end
end
