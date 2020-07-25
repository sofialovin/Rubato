class CreateLyrics < ActiveRecord::Migration[6.0]
  def change
    create_table :lyrics do |t|
      t.string :text
      t.references :song, null: false, foreign_key: true

      t.timestamps
    end
  end
end
