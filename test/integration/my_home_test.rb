require File.dirname(__FILE__) + '/../test_helper'

class MyHomePageTest < ActionController::IntegrationTest
  fixtures :users


  def test_displaying_messages
    message = Factory.create(:message)
    visit "/login"
    fill_in "Login", :with => "to_user"
    fill_in "Password", :with => "fooblyfoo"
    click_button "Log in"
    assert page.has_content? "Logged in successfully"
    visit "/my_splogna"
    assert page.has_content? "about something"
  end

end
