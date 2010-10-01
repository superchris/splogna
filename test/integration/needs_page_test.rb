require File.dirname(__FILE__) + '/../test_helper'

class NeedsPageTest < ActionController::IntegrationTest
  fixtures :users

  def setup
    visit "/login"
    fill_in "Login", :with => "quentin"
    fill_in "Password", :with => "monkey"
    click_button "Log in"
  end
  
  def test_create_need
    visit "/needs/new"
    fill_in "Title", :with => "A title"
    fill_in "Description", :with => "A description"
    click_button "Save"
    assert page.has_content? "A title"
  end

  def test_create_need_with_tag
    visit "/needs/new"
    fill_in "Title", :with => "A title"
    fill_in "Description", :with => "A description"
    fill_in "Tags", :with => "car furniture apples"
    click_button "Save"
    assert page.has_content? "A title"
  end

  def test_create_two_needs
    visit "/needs/new"
    fill_in "Title", :with => "A title"
    fill_in "Description", :with => "A description"
    fill_in "Tags", :with => "car furniture apples"
    click_button "Save"
    assert page.has_content? "A title"
    visit "/needs/new"
    fill_in "Title", :with => "Another title"
    fill_in "Description", :with => "A description"
    fill_in "Tags", :with => "car furniture apples"
    click_button "Save"
    assert page.has_content? "Another title"
  end

  def pending_test_needs_paging
    user = Factory.create(:user)
    31.times do
      Factory.create(:need, :user => user)
    end
    visit "/needs"
    assert page.has_content? "Next"
  end

  def test_view_need
    need = Need.new(:title => "a new title", :description => "description")
    need.tag_list = "tag1 tag2"
    need.save!
    visit need_path(need)
    assert page.has_content? "title"
    assert page.has_content? "tag1 tag2"
  end

  def test_respond_to_need
    need = Need.new(
      :title => "a new title", :description => "description",
      :user => users(:quentin))
    need.save!
    visit need_path(need)
    assert_match /Response to: a new title/, field_labeled("Subject").value
    fill_in "Body", :with => "I'll take care of this"
    click_button "Send Response"
    assert page.has_content? "Message sent."
    assert page.has_content? "1 user(s) has responded to this need."
    assert_equal 1, need.reload.responses.count
  end
end
