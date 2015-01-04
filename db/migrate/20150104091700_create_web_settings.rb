class CreateWebSettings < ActiveRecord::Migration
  def change
    create_table :web_settings do |t|
      t.attachment :favicon
      t.attachment :logo
      t.string :title
      t.text :description
      t.text :keywords
      t.text :header_tags
      t.text :footer_tags
      t.string :phone
      t.string :email
      t.string :facebook_url
      t.string :twitter_url
      t.string :gplus_url

      t.timestamps
    end
  end
end
