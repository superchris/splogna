class GotsController < ApplicationController

  def new
    @got = Got.new
  end

  def create
    @got = Got.new(params[:got])
    @got.user = current_user
    if @got.save
      redirect_to "/my_splogna"
    end
  end

  def index
    @gots = Got.search(params[:search])
  end
  
  def show
    @got = Got.find(params[:id])
  end

end
