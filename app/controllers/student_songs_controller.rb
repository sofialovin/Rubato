class StudentSongsController < ApplicationController

  def destroy
    @student_song = StudentSong.find(params[:id])
    @student = Student.find(params[:student_id])
    @student_song.destroy
    redirect_to student_path(@student)
    authorize @student_song
  end
  
  def create 
  @song = Song.find(params[:song])
  @student = Student.find(params[:student_id])
  @student_song = StudentSong.new(song_params)
  @student_song.song = @song 
  @student_song.student = @student
  authorize @student_song
  @student_song.save
  redirect_to songs_path
  end

  private

  def song_params
    params.permit(:student_id, :song_id)
  end


end
