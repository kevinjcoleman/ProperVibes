class AddIndexToSongs < ActiveRecord::Migration
  def change
  	add_index :songs, :slug
  end
end
