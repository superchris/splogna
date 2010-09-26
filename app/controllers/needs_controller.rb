class NeedsController < ApplicationController

  respond_to :html, :xml

  def new
    @need = Need.new
  end

  def create
    @need = Need.new(params[:need])
    @need.user = current_user
    @need.save
    respond_with @need, :location => "/my_splogna"
  end

  def index
    @needs = Need.search(params[:search])
    respond_with @needs
  end
  
  def show
    @need = Need.find(params[:id])
    @message = Message.new(
      :response_to => @need,
      :to_user => @need.user,
      :subject => "Response to: #{@need.title}")
  end

end
