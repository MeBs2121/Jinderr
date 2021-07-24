class ContactsController < ApplicationController
  before_action :authenticate_account!

  def new
    @contact = current_account.contacts.build
  end

  def create
    # binding.pry
    @contact = current_account.contacts.build(contact_params)
    if @contact.save
      ContactMailer.send_contact(@contact).deliver_later

      redirect_to contacts_confirm_path, notice: "sent contact mail."
    else
      render :new
    end
  end

  def confirm
    
  end

  private
  def contact_params
    params.require(:contact).permit(:subject, :content)
  end
end
