class MessageObserver < ActiveRecord::Observer
  def after_create(message)
    MessageMailer.deliver_message(message)
  end

end
