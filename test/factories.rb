Factory.define :user do |user|
  user.name "Foo USer"
  user.login "foo"
  user.email "foo@bar.com"
  user.password "fooblyfoo"
  user.password_confirmation "fooblyfoo"
  user.activated_at Time.now
end

Factory.define :need do |need|
  need.title "A need"
  need.description "Description of that need"
  need.association :user, :factory => :user
end

Factory.define :message do |message|
  message.subject "about something"
  message.body "this is the body of the message"
  message.from_user  {|user| user.association(:user,
      :login => "from_user", :email => "from@foo.com")}
  message.to_user  {|user| user.association(:user,
      :login => "to_user", :email => "to@foo.com")}
  message.association :response_to, :factory => :need
end
