class MySplognaController < ApplicationController
  def index
    @needs = current_user.needs
  end

end
