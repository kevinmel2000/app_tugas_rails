class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.attachment :avatar
      t.string :gender
      t.string :brithday
      t.string :phone

      t.timestamps
    end
  end
end
