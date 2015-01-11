class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :transmission
      t.string :kilometer
      t.string :seat
      t.string :door
      t.string :color
      t.string :production_year
      t.string :number_plate
      t.string :engine
      t.string :fuel

      t.timestamps
    end
  end
end
