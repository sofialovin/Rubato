class StudentSongsController < ApplicationController

  def destroy
    # @student_song = StudentSong.find(params[:test_id])
    # puts @student_song
    # @student_song.destroy

    redirect_to student_path
  end
end
