class MySplognaController < ApplicationController
  before_filter :login_required
  
  def index
    @needs = current_user.needs
    @gots = current_user.gots
  end

end
