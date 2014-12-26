class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :province
      t.string :city
      t.text :address
      t.string :postcode

      t.timestamps
    end
  end
end
