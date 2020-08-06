class SongsController < ApplicationController
  def index
    @songs = policy_scope(Song).order(created_at: :desc)
  end

  def show
    @song = Song.find(params[:id])

    # raise
    authorize @song
  end

  def new
    @song = Song.new
    authorize @song
  end

  def create
    @song = Song.new(song_params)
    @song.user = current_user
    authorize @song
    @song.save!
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:name, :skill_level, :user_id, :html)
  end
end
