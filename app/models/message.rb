class Message < ActiveRecord::Base
  belongs_to :from_user, :class_name => "User"
  belongs_to :to_user, :class_name => "User"
  belongs_to :response_to, :polymorphic => true

  validates_presence_of :from_user, :to_user
end
