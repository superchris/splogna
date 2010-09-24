
class Got < ActiveRecord::Base
  validates_presence_of :title, :description
  belongs_to :user

  acts_as_taggable

  def self.search(term)
    query_term = "%#{term}%"
    where(Got[:title].matches(query_term).or(Got[:description].matches(query_term)))
  end
end
