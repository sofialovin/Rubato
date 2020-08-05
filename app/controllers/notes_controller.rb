class NotesController < ApplicationController
  def create
    @lesson = Lesson.find(params[:lesson_id])
    @note = Note.new(note_params)
    @note.lesson = @lesson
    if @note.save
      redirect_to lesson_path(@lesson)
    else
      render '/lessons'
    end
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end
end
