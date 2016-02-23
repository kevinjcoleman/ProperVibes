class ContactFormMailer < ApplicationMailer

	def contact_form_response(contact_form)
		@email = contact_form.email
		@subject = "[#{ContactForm.sanitize_contact_type(contact_form.contact_type)}] #{contact_form.subject}"
		@content = contact_form.content
		mail(to: @email, subject: @subject)
	end
end
