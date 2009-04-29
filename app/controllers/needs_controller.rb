class NeedsController < ApplicationController

  def new
    @need = Need.new
  end

  def create
    @need = Need.new(params[:need])
    @need.user = current_user
    if @need.save
      redirect_to "/my_splogna"
    end
  end

  def index
    @needs = Need.search(params[:search])
  end
  
  def show
    @need = Need.find(params[:id])
    @message = Message.new(
      :response_to => @need,
      :to_user => @need.user,
      :subject => "Response to: #{@need.title}")
  end

end
