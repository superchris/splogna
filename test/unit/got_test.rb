require File.dirname(__FILE__) + '/../test_helper'

class GotTest < ActiveSupport::TestCase
  fixtures :users
  def test_create
    got = Got.new :title => "a title", :description => "a description"
    got.save!
    assert got.reload
    assert got.created_at
  end

  def test_that_title_is_required
    got = Got.new :description => "foo"
    assert ! got.valid?
  end

  def test_that_description_is_required
    got = Got.new :title => "foo"
    assert ! got.valid?
  end

  def test_gots_belong_to_user
    user = User.create!({ :login => 'quire',
        :email => 'quire@example.com',
        :password => 'quire69',
        :password_confirmation => 'quire69' })
    got = Got.new(:title => "title",
      :description => "description",
      :user => user
    )
    got.save!
    assert_equal user, got.reload.user
  end

  def test_searching_for_gots
    got1 = Got.create!(:title => "first title",
      :description => "something about cars",
      :user => users(:quentin)
    )
    got2 = Got.create!(:title => "other title",
      :description => "apples and pears",
      :user => users(:quentin)
    )
    assert_equal [got2], Got.search("apples")
    assert_equal [got1], Got.search("car")
    assert_equal [got1], Got.search("first")
  end

end
