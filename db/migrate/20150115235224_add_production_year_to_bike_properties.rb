class AddProductionYearToBikeProperties < ActiveRecord::Migration
  def change
    add_column :bike_properties, :production_year, :string
  end
end
