require File.dirname(__FILE__) + '/../test_helper'

class HomePageTest < ActionController::IntegrationTest
  fixtures :users

  def test_good_login
    visit "/login"
    fill_in "Login", :with => "quentin"
    fill_in "Password", :with => "monkey"
    click_button "Log in"
    assert page.has_content? "Logged in successfully"
  end

  def test_bad_login
    visit "/login"
    fill_in "Login", :with => "quentin"
    fill_in "Password", :with => "not monkey"
    click_button "Log in"
    assert page.has_no_content? "Logged in successfully"
  end
end
