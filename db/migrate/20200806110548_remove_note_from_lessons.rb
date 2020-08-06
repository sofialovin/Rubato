class RemoveNoteFromLessons < ActiveRecord::Migration[6.0]
  def change
    remove_column :lessons, :note, :text
  end
end
