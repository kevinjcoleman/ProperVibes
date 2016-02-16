class SongsController < ApplicationController

  def index
  	@songs = Song.published_recently
  end

  def show
  	@song = Song.find(params[:id])
  end

  private
  	def set_to_admin
  		@admin = true
  	end
end
