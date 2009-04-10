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
  
  def show
    @need = Need.find(params[:id])
  end

end
