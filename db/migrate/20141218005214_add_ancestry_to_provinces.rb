class AddAncestryToProvinces < ActiveRecord::Migration
  def change
    add_column :provinces, :ancestry, :string
  end
end
