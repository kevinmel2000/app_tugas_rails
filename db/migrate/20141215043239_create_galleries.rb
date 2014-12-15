class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.attachment :file
      t.string :galleriable_type
      t.integer :galleriable_id

      t.timestamps
    end
  end
end
