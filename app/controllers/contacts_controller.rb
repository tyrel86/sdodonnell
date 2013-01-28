class ContactsController < ApplicationController
  def create
		MainMailer.contact_form_email( Contact.new(params[:contact]) ).deliver
		redirect_to root_path, notice: "Thank you for you feed back I will respond soon."
  end
end
