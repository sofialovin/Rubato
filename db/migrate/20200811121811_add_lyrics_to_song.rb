class AddLyricsToSong < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :lyrics, :string
  end
end
