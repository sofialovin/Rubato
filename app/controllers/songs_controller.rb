require 'nokogiri'

class SongsController < ApplicationController

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index

    if params[:query].present?
      @songs = policy_scope(Song).where("name LIKE ?", "%#{params[:query].capitalize}%")
    else
      @songs = Song.all.order(created_at: :desc)
      @students = policy_scope(Student).order(created_at: :desc)
    end
  end

  def show
    @song = Song.find(params[:id])

    # raise
    authorize @song
    # redirect_to song_path(@song.id)
    # redirect_to request.referrer

  end

  def new
    @song = Song.new
    authorize @song
  end

  def create
    # raise
    @song = Song.new(song_params)
    authorize @song
    @song.user = current_user
    if @song.save
      redirect_to songs_path
    else
      puts "Not saved"
    end
  end

  def edit
    @song = Song.find(params[:id])
    # @song.user = current_user
    authorize @song
  end

  def update
    # raise
    @song = Song.find(params[:id])
    authorize @song
    if @song.update(song_params)
      redirect_to edit_song_path(@song), alert: "Listing updated!"
    else
      redirect_to edit_song_path(@song), alert: "Listing not updated!"

    end
  end

    def destroy
      @song = Song.find(params[:id])
      authorize @song
      @song.destroy
      redirect_to songs_path
    end

  private

  def song_params
    params.require(:song).permit(:name, :id, :skill_level, :user_id, :html)
  end

  def user_not_authorized
    flash[:alert] = "You can only edit or delete your own songs."
    redirect_to(request.referrer || root_path)
  end
end
