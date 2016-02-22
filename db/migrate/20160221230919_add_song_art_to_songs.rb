class AddSongArtToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :song_art, :string
  end
end
