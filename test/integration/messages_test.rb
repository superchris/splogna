require File.dirname(__FILE__) + '/../test_helper'

class MessagesTest < ActionController::IntegrationTest

  def setup
    @message = Factory.create(:message)
    visit "/login"
    fill_in "Login", :with => "to_user"
    fill_in "Password", :with => "fooblyfoo"
    click_button "Log in"
    assert page.has_content? "Logged in successfully"
    visit "/my_splogna"
  end

  def test_viewing
    click_link "about something"
    assert page.has_content? "body of the message"
  end

  def test_replying

    click_link "about something"
    fill_in "Subject", :with => "this is a reply"
    fill_in "Body", :with => "i have boo to say to you"
    click_button "Send"
    assert page.has_content? "Message sent."
    visit "/logout"
    visit "/login"
    fill_in "Login", :with => "from_user"
    fill_in "Password", :with => "fooblyfoo"

  end
end
