class Admin::Site::SongsController < ApplicationController
  before_action :set_to_admin

  def index
    @songs = Song.unpublished_first_then_recently
  end

  def new
  	@song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:success] = "Song created!"
      redirect_to edit_admin_site_song_path @song 
    else
      render 'new'
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update_attributes(song_params)
    flash[:success] = "Song saved!"
    redirect_to edit_admin_site_song_path @song
  end

  def publish
    @song = Song.find(params[:id])
    if @song.publish
      flash[:success] = "Song successfully published!"
      redirect_to edit_admin_site_song_path @song
    else
      flash[:danger] = "You need to add art to the song before you publish it!"
      redirect_to edit_admin_site_song_path @song
    end
  end

  def unpublish
    @song = Song.find(params[:id])
    @song.published_at = nil
    @song.save
    flash[:danger] = "Song unpublished!"
    redirect_to edit_admin_site_song_path @song
  end


  private
  	def set_to_admin
  		@admin = true
  	end

    def song_params
      params.require(:song).permit(:name, :soundcloud_url, :slug, :song_art)
    end

end
