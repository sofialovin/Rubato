class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :skill_level
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
