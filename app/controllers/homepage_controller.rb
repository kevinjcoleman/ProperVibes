class HomepageController < ApplicationController
	def home
			@songs = Song.published_recently.limit(12).paginate(:page => params[:page], :per_page => 4)
			@contact_form = ContactForm.new
	end
end
