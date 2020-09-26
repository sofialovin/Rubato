class ChordsController < ApplicationController

  def index
    @chords = Chord.all
    authorize @chords
    redirect_to new_song_path
  end

  def show
  end

  def update
    @chord = Chord.find_by_id params[:id]
    @chord.update chord_params

    authorize @chord
    @chord.save!
    # respond_to do |format|
    #   format.js
    # end

     if @chord.save
      # raise
      # redirect_to new_song_path
    else
      puts "Not saved"
    end

  end

  private

  def chord_params
    params.require(:chord).permit(:highest_fret)
  end
end
