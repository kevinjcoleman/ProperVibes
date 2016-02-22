class ContactFormsController < ApplicationController
  def create
  	@contact_form = ContactForm.new(contact_form_params)
  	if @contact_form.save 
  		flash[:success] = "Your request has been longed, we will reach out to as soon as we can."
  		redirect_to root_path
  	else
  		flash[:danger] = "Something went wrong, please try again."
  		redirect_to new_contact_form_path
  	end
  end

  def new
  end

  private
   def contact_form_params
   	params.require(:contact_form).permit(:subject, :content, :email_address, :contact_type)
   end
end
