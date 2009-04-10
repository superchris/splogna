require File.dirname(__FILE__) + '/../test_helper'

class NeedsPageTest < ActionController::IntegrationTest
  fixtures :users

  def test_create_need
    visit "/login"
    fill_in "Login", :with => "quentin"
    fill_in "Password", :with => "monkey"
    click_button "Log in"
    assert_contain "Logged in successfully"
    visit "/needs/new"
    fill_in "Title", :with => "A title"
    fill_in "Description", :with => "A description"
    click_button "Save"
    assert_contain "A title"
  end

end
