require File.dirname(__FILE__) + '/../test_helper'

class HomePageTest < ActionController::IntegrationTest
  fixtures :users

  def test_home_page
    visit "/"
    assert_contain "Sign Up"
    assert_contain "Login"
  end

  def test_home_page_logged_in
    visit "/login"
    fill_in "Login", :with => "quentin"
    fill_in "Password", :with => "monkey"
    click_button "Log in"
    assert_contain "Logged in successfully"
    visit "/"
    assert_not_contain "Sign Up"
    assert_contain "Log Out"
  end
end
