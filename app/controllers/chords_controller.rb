class ChordsController < ApplicationController
  def update
    @chord = Chord.find_by_id params[:id]
    @chord.update chord_params
    @chord.save
    respond_to do |format|
      format.js
    end
  end

  private

  def chord_params
    params.require(:chord).permit(:highest_fret)
  end
end
