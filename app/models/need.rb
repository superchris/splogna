
class Need < ActiveRecord::Base
  validates_presence_of :title, :description
  belongs_to :user
end
