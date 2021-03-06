require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  fixtures :users

  def setup
    @need = Need.new(:title => "title", :description => "description",
      :user => users(:quentin))
    @need.save!
    ActionMailer::Base.deliveries = []
  end

  test "creating a message" do
    message = Message.new(:from_user => users(:quentin),
      :to_user => users(:aaron),
      :subject => "hello", :body => "There",
      :response_to => @need
    )
    assert message.save
    assert message.id
    assert_equal 1, ActionMailer::Base.deliveries.size
    message = ActionMailer::Base.deliveries[0]
  end

  test "messages can belong to need" do

    message = Message.new(:from_user => users(:quentin),
      :to_user => users(:aaron),
      :subject => "hello", :body => "There",
      :response_to => @need
    )
    assert message.save
    assert_equal @need, message.reload.response_to
    assert_equal 1, @need.reload.responses.count
    assert_equal message, @need.responses[0]
  end

  test "messages belong to users" do
    message = Message.create!(:from_user => users(:quentin),
      :to_user => users(:aaron),
      :subject => "hello", :body => "There",
      :response_to => @need
    )
    assert_equal [message], users(:quentin).messages_from
    assert_equal [message], users(:aaron).messages_to
  end
end
