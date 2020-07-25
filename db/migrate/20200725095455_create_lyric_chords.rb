class CreateLyricChords < ActiveRecord::Migration[6.0]
  def change
    create_table :lyric_chords do |t|
      t.integer :position
      t.references :chord, null: false, foreign_key: true
      t.references :lyric, null: false, foreign_key: true

      t.timestamps
    end
  end
end
