require 'test_helper'

class NeedsControllerTest < ActionController::TestCase
  def test_index_xml
    @need = Factory(:need)
    get :index, :format => :xml
    assert_match /<title>#{@need.title}/,  response.body
  end
end