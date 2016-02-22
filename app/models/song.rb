class Song < ActiveRecord::Base
	mount_uploader :song_art, SongArtUploader
	extend FriendlyId
	friendly_id :name, use: [:slugged, :finders]
	#Validations
	validates :name, presence: true
	validates_format_of :soundcloud_url, :with => /#{Regexp.quote('https://soundcloud.com/')}/i, :message => "You must supply a link to the song on Soundcloud with the format of 'https://soundcloud.com/'."
	validates_uniqueness_of :name, :case_sensitive => false
	
	#Scopes
	scope :unpublished_first_then_recently, -> { order("published_at IS NULL DESC, published_at desc") }
	scope :published_recently, -> { where("published_at IS NOT NULL").order("published_at desc") }

	def has_art?
		if self.song_art.url
			true
		else 
			false
		end
	end

	def publish
		if self.has_art?
			self.published_at = Time.now
			self.save
			return true
		else
			return false
		end
	end

	def published?
		self.published_at != nil ? true : false
	end
end
