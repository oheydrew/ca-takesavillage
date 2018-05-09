class ContactMailer < ApplicationMailer
  def send_email
    sender = ENV.fetch('MAILGUN_SENDER_ADDRESS')
    form_params = params[:contact]
    @name = form_params[:name]
    @message = form_params[:message]

    mail(to: sender)
  end

  def contact_email(mail_info)
    recipient = ENV.fetch('EMAIL_CONTACT')
    @user = mail_info[:user]
    @message = mail_info[:message]

    subject = "TAKESAVILLAGE: New contact email from #{@user.profile.full_name}"

    mail(to: recipient, subject: subject)
  end

end
