
class Got < ActiveRecord::Base
  validates_presence_of :title, :description
  belongs_to :user

  acts_as_taggable

  extend Searchable
end
