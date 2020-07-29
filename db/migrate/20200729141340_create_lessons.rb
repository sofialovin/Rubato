class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.datetime :date
      t.datetime :start_time
      t.integer :duration
      t.text :note
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
