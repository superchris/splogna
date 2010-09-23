require File.dirname(__FILE__) + '/../test_helper'

class TagsTest < ActionController::IntegrationTest
  fixtures :users

  def test_show
    need = Need.new(:title => "title",
      :user => User.find(:first),
      :description => "description")
    need.tag_list = "foo"
    need.save!
    foo_tag = Tag.find_by_name("foo")
    visit tag_path(foo_tag)
    assert page.has_content? "title"
  end

end
