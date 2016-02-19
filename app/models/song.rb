class Song < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: [:slugged, :finders]

	ACCEPTED_URL_HASH = {
		" " => "_",
		"(" => "",
		"." => "",
		")" => "",
		"é" => "e"
	}

	#Scopes
	scope :unpublished_first_then_recently, -> { order("published_at IS NULL DESC, published_at desc") }
	scope :published_recently, -> { order(published_at: :desc) }


	def published?
		self.published_at != nil ? true : false
	end
end
