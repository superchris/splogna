require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  setup do
    @user = Factory(:user)
  end

  test "signup_notification" do
    mail = UserMailer.signup_notification(@user)
    assert_match /\[Splogna\] .*activate your.*account/, mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["admin@splogna.com"], mail.from
    assert_match activate_url(:activation_code => @user.activation_code), mail.body.encoded
    assert_match @user.login, mail.body.encoded
    assert_match @user.password, mail.body.encoded
  end

  test "activation" do
    mail = UserMailer.activation(@user)
    assert_match /\[Splogna\] .*activated/, mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["admin@splogna.com"], mail.from
    assert_match "http://www.splogna.com", mail.body.encoded
    assert_match @user.login, mail.body.encoded
  end

end
