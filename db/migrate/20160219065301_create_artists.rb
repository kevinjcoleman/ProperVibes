class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.text :description
      t.string :soundcloud_profile
      t.string :twitter_profile
      t.string :facebook_page
      t.string :slug

      t.timestamps null: false
    end
  end
end
