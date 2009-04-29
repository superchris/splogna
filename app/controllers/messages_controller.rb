class MessagesController < ApplicationController
  def create
    @message = Message.new(params[:message])
    @message.from_user = current_user
    @message.save!
    flash[:success] = "Message sent."
    redirect_to url_for(@message.response_to)
  end

  def show
    @message = Message.find(params[:id])
    @reply = Message.new(:from_user => current_user,
      :response_to => @message,
      :to_user => @message.from_user, :subject => @message.subject)
  end
end
