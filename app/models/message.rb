class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :response_to, :polymorphic => true

  validates_presence_of :user
end
