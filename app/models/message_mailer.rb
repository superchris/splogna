class MessageMailer < ActionMailer::Base
  def message(message)
    @from = "admin@splogna.com"
    @subject = message.subject
    @recipients  = "#{message.to_user.email}"
    @sent_on = Time.now
    @body[:message]  = message
  end
  
end
