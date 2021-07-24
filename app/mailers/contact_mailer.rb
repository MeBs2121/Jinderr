class ContactMailer < ApplicationMailer
  def send_contact(contact)
    @contact = contact
    mail to:   Rails.application.credentials.gmail[:address], subject: '【お問い合わせ】' + @contact.subject
  end
end
