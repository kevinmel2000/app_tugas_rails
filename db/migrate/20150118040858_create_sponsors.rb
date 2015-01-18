class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.attachment :image
      t.string :link_url
      t.string :title

      t.timestamps
    end
  end
end
