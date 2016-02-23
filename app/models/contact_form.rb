class ContactForm < ActiveRecord::Base
	after_create :contact_form_mailer
	enum contact_type: [ :booking_request, :press_inquiry, :other ]
	validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, :message => "You must supply a valid email so that we can respond to your request."
	validates :content, presence: true
	validates :subject, presence: true
	validates :contact_type, presence: true

	def self.readable_keys
		translated_keys = []
		ContactForm.contact_types.keys.each do |key|
			translated_keys << key.gsub('_', ' ').capitalize
		end
		return translated_keys
	end

	def self.sanitize_contact_type(contact_type)
		return contact_type.gsub(' ', '_').downcase
	end

	def contact_form_mailer
		ContactFormMailer.contact_form_response(self).deliver_now
	end

end
