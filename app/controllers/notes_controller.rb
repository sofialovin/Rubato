class NotesController < ApplicationController
  def new
    @note = Note.new
    authorize @note
  end

  def create
    @note = Note.new(note_params)
    @lesson = Lesson.find(params[:lesson_id])
    @note.lesson = @lesson
    authorize @note

    if @note.save
      # redirect_to my_dashboard_path, anchor: "note-#{@note.id}"
     redirect_to my_dashboard_path + "#note-#{@lesson.id}"

    else
      render '/dashboards/my_dashboard'
    end
  end

  private

  def note_params
    params.require(:note).permit(:content, :lesson_id)
  end
end



