class AddVoicingToChords < ActiveRecord::Migration[6.0]
  def change
    add_column :chords, :voicing, :string
  end
end
