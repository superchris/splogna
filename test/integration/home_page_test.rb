require File.dirname(__FILE__) + '/../test_helper'

class HomePageTest < ActionController::IntegrationTest
  fixtures :users

  def test_home_page
    visit "/logout"
    visit "/"

    assert page.has_content? "Sign Up"
  end

  def test_home_page_logged_in
    visit "/login"
    fill_in "Login", :with => "quentin"
    fill_in "Password", :with => "monkey"
    click_button "Log in"
    assert page.has_content? "Logged in successfully"
    visit "/"
    assert page.has_no_content? "Sign Up"
    assert page.has_content? "Log Out"
  end

  def test_search
    need1 = Need.create!(:title => "first title",
      :description => "something about cars",
      :user => users(:quentin)
    )
    visit "/"
    fill_in "search", :with => "cars"
    click_button "Search"
    assert page.has_content? "first"
  end

end
