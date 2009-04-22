class MessagesController < ApplicationController
  def create
    @message = Message.new(params[:message])
    @message.user = current_user
    @message.save!
    flash[:success] = "Thanks for responding."
    redirect_to need_url(@message.response_to)
  end
end
