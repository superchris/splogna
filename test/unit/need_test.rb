require File.dirname(__FILE__) + '/../test_helper'

class NeedTest < ActiveSupport::TestCase
  fixtures :users
  def test_create
    need = Need.new :title => "a title", :description => "a description"
    need.save!
    assert need.reload
    assert need.created_at
  end

  def test_that_title_is_required
    need = Need.new :description => "foo"
    assert ! need.valid?
  end

  def test_that_description_is_required
    need = Need.new :title => "foo"
    assert ! need.valid?
  end

  def test_needs_belong_to_user
    user = User.create!({ :login => 'quire',
        :email => 'quire@example.com',
        :password => 'quire69',
        :password_confirmation => 'quire69' })
    need = Need.new(:title => "title",
      :description => "description",
      :user => user
    )
    need.save!
    assert_equal user, need.reload.user
  end

  def test_searching_for_needs
    need1 = Need.create!(:title => "first title",
      :description => "something about cars",
      :user => users(:quentin)
    )
    need2 = Need.create!(:title => "other title",
      :description => "apples and pears",
      :user => users(:quentin)
    )
    assert_equal [need2], Need.search("apples")
    assert_equal [need1], Need.search("car")
    assert_equal [need1], Need.search("first")
  end

end
