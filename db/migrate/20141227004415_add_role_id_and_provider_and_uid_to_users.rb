class AddRoleIdAndProviderAndUidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role_id, :integer
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
