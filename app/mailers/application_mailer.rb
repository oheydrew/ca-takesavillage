class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('MAILGUN_SENDER_ADDRESS')
  layout 'mailer'
end
