class AddHtmlToSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :html, :string
  end
end
