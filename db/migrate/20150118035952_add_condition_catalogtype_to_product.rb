class AddConditionCatalogtypeToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :condition, :string
    add_column :products, :catalog_type, :string
  end
end
