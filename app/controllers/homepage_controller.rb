class HomepageController < ApplicationController
	def home
		@songs = Song.published_recently.limit(4)

	end
end
