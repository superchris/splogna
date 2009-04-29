class MySplognaController < ApplicationController
  before_filter :login_required
  
  def index
    @needs = current_user.needs
    @gots = current_user.gots
    @messages = current_user.messages_to
  end

end
