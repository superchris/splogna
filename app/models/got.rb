
class Got < ActiveRecord::Base
  validates_presence_of :title, :description
  belongs_to :user

  acts_as_taggable

  def self.search(term)
    query_term = "%#{term}%"
    where(["title like ? or description like ?", query_term, query_term])
  end
end
