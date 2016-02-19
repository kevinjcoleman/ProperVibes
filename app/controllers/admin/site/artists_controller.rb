class Admin::Site::ArtistsController < ApplicationController
  before_action :set_to_admin
  
  def index
  	@artists = Artist.all
  end

  def new
  	@artist = Artist.new
  end

  def create
  	@artist = Artist.create(artist_params)
  	if @artist
  		flash[:success] = "Artist created!"
  		redirect_to edit_admin_site_artist_path @artist
  	else
  		flash[:danger] = "Something went wrong"
  		redirect_to new_admin_site_artist_path
  	end
  end

  def edit 
  	@artist = Artist.find(params[:id])
  end

  def update 
		@artist = Artist.find(params[:id])
		@artist.update_attributes(artist_params)
		redirect_to edit_admin_site_artist_path @artist
  end


   private
  	def set_to_admin
  		@admin = true
  	end

  	def artist_params
      params.require(:artist).permit(:name, :description, :soundcloud_profile, :twitter_profile, :facebook_page)
    end
end
