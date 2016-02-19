class HomepageController < ApplicationController
	def home
		@songs = Song.published_recently.limit(4)
		@songs_for_player = Array.new
		Song.published_recently.limit(10).each{ |s| @songs_for_player << "#{s.soundcloud_url.to_s}" }
	end
end
