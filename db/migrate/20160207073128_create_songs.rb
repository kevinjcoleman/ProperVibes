class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :slug
      t.string :name
      t.datetime :published_at
      t.string :soundcloud_url

      t.timestamps null: false
    end
  end
end
