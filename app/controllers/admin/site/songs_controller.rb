class Admin::Site::SongsController < ApplicationController
  before_action :set_to_admin

  def index
    @songs = Song.unpublished_first_then_recently
  end

  def new
  	@song = Song.new
  end

  def create
    @song = Song.create(name: params[:song][:name], soundcloud_url: params[:song][:soundcloud_url])
    redirect_to edit_admin_site_song_path @song 
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update_attributes(song_params)
    redirect_to edit_admin_site_song_path @song
  end

  def publish
    @song = Song.find(params[:id])
    @song.published_at = Time.now
    @song.save
    redirect_to edit_admin_site_song_path @song
  end

  def unpublish
    @song = Song.find(params[:id])
    @song.published_at = nil
    @song.save
    redirect_to edit_admin_site_song_path @song
  end


  private
  	def set_to_admin
  		@admin = true
  	end

    def song_params
      params.require(:song).permit(:name, :soundcloud_url, :slug)
    end

end