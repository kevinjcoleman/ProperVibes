class ContactFormsController < ApplicationController
  def create
  	@contact_form = ContactForm.new(contact_form_params)
    @contact_form.contact_type = ContactForm.sanitize_contact_type(params[:contact_form][:contact_type]) if params[:contact_form][:contact_type]
  	if @contact_form.save 
  		flash[:success] = "Your request has been longed, we will reach out to as soon as we can."
  		redirect_to root_path
  	else
  		render "new"
  	end
  end

  def new
    @contact_form = ContactForm.new
  end

  private
   def contact_form_params
   	params.require(:contact_form).permit(:subject, :content, :email)
   end
end
