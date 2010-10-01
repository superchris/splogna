class MessageMailer < ActionMailer::Base
  def message_mail(message)
    @message = message
    mail(:to => message.to_user.email,
         :from => "admin@splogna.com",
         :subject => message.subject)
  end
end
