class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @needs = @tag.tagged
  end

end
