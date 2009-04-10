require File.dirname(__FILE__) + '/../test_helper'

class NeedTest < ActiveSupport::TestCase
  fixtures :users
  def test_create
    need = Need.new :title => "a title", :description => "a description"
    need.save!
    assert need.reload
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
end
