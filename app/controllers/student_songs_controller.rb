class StudentSongsController < ApplicationController

  def destroy
    @student_song = StudentSong.find(params[:id])
    @student = Student.find(params[:student_id])
    @student_song.destroy
    redirect_to student_path(@student)
    authorize @student_song
  end
end
