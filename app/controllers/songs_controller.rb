require 'nokogiri'

class SongsController < ApplicationController
  def index
    if params[:query].present?
      @songs = policy_scope(Song).where("name LIKE ?", "%#{params[:query].capitalize}%")
    else
      @songs = policy_scope(Song).order(created_at: :desc)
      @students = policy_scope(Student).order(created_at: :desc)
    end
  end

  def show
    @song = Song.find(params[:id])

    # raise
    authorize @song
    parsed_data = Nokogiri::HTML.parse(@song.html)
    @chordlines = parsed_data.css(".target-area").select{|t| t['id'] != nil}
    @clones = []
    @chordlines.each do |chordline|
      clones_row = chordline.css(".draggable")
      @clones << clones_row
    end
  end

  def new
    @song = Song.new
    authorize @song
  end

  def create
    @song = Song.new(song_params)
    # raise
    authorize @song
    @song.user = current_user
    @song.save!
    redirect_to songs_path
  end

  def edit
    @song = Song.find(params[:id])
    # @song.user = current_user
    authorize @song
  end

    def destroy
      @song = Song.find(params[:id])
      @song.destroy
      redirect_to songs_path
      authorize @song
    end

  def update
    @song = Song.find(params[:id])
    authorize @song
     if @song.update(song_params)
      redirect_to instrument_path(@song), alert: "Listing updated!"
    else
      redirect_to songs_path
    end
  end

  private

  def song_params
    params.require(:song).permit(:name, :id, :skill_level, :user_id, :html)
  end
end
