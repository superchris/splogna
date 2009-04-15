class MySplognaController < ApplicationController
  before_filter :login_required
  
  def index
    @needs = current_user.needs
  end

end
