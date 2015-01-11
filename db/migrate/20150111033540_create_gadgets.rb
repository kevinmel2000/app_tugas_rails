class CreateGadgets < ActiveRecord::Migration
  def change
    create_table :gadgets do |t|
      t.string :sku
      t.string :shipping_weight
      t.string :waranty
      t.string :color
      t.string :processor
      t.string :Os
      t.string :sim
      t.string :memory
      t.string :camera
      t.string :dimension
      t.string :display
      t.string :network
      t.string :battery

      t.timestamps
    end
  end
end
