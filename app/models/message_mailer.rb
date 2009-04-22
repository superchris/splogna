class MessageMailer < ActionMailer::Base
  def message(message)
    @from = "admin@splogna.com"
    @subject = "Response to: #{message.response_to.title}"
    @recipients  = "#{message.response_to.user.email}"
    @sent_on = Time.now
    @body[:message]  = message
  
  end
  
end
