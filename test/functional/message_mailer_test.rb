require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase
  test "message_mail" do
    message = Factory(:message)
    mail = MessageMailer.message_mail(message)
    assert_equal [message.to_user.email], mail.to
    assert_equal message.subject, mail.subject
    assert_equal ["admin@splogna.com"], mail.from
    assert_match message.body, mail.body.encoded
  end

end
