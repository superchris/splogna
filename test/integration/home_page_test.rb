require File.dirname(__FILE__) + '/../test_helper'

class HomePageTest < ActionController::IntegrationTest
  def test_home_page
    visit "/"
  end
end
