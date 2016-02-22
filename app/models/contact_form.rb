class ContactForm < ActiveRecord::Base
	enum contact_type: [ :booking_request ]
	validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, :message => "You must supply a valid email so that we can respond to your request."
	validates :content, presence: true
	validates :subject, presence: true

	def self.readable_keys
		translated_keys = []
		ContactForm.contact_types.keys.each do |key|
			translated_keys << key.gsub("_", " ")
		end
	end

end
