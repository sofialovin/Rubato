class CreateStudentSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :student_songs do |t|
      t.references :song, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
