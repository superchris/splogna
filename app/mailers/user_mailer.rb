class UserMailer < ActionMailer::Base
  default :from => "admin@splogna.com"

  def signup_notification(user)
    @user = user
    @url = activate_url(:activation_code => @user.activation_code)

    mail(:to => user.email,
         :subject => subject("Please activate your new account"))
  end

  def activation(user)
    @user = user
    @url = "http://www.splogna.com/"

    mail(:to => user.email,
         :subject => subject("Your account has been activated!"))
  end

  private

  def subject(text)
    "[Splogna] #{text}"
  end
end
