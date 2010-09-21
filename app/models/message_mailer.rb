class MessageMailer < ActionMailer::Base

  def message_mail(message)
    @message = message
    mail(:from => "admin@splogna.com",
         :to => message.to_user.email,
         :subject => message.subject)

  end

end
