
class Need < ActiveRecord::Base
  validates_presence_of :title, :description
  belongs_to :user

  has_many :responses, :class_name => "Message",
    :foreign_key => "response_to_id",
    :source_type => "Need"
  
  acts_as_taggable

  extend Searchable
end
