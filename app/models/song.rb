class Song < ActiveRecord::Base
	#after_create :create_slug
	#before_save :update_slug
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
=begin
	def create_slug
		downcased_name = name.downcase
		ACCEPTED_URL_HASH.each do |key,value| 
			downcased_name = downcased_name.gsub(key, value)
		end
		self.slug = downcased_name
		self.save
	end
	
	def update_slug
		if self.name
			downcased_name = name.downcase
			ACCEPTED_URL_HASH.each do |key,value| 
				downcased_name = downcased_name.gsub(key, value)
			end
			self.slug = downcased_name
		end
	end
=end

	def published?
		self.published_at != nil ? true : false
	end
end
