class RenameChordVoicingToHighestFret < ActiveRecord::Migration[6.0]
  def change
    rename_column :chords, :voicing, :highest_fret
  end
end
