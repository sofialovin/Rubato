class SongsController < ApplicationController
  def index
    @songs = policy_scope(Song).order(created_at: :desc)
  end
end
