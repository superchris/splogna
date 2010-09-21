class MessageObserver < ActiveRecord::Observer
  def after_create(message)
    MessageMailer.message_mail(message).deliver
  end

end
