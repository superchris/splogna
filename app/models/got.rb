
class Got < ActiveRecord::Base
  validates_presence_of :title, :description
  belongs_to :user

  acts_as_taggable

  def self.search(term)
    t = Got.arel_table
    query_term = "%#{term}%"
    where(t[:title].matches(query_term).or(t[:description].matches(query_term)))
  end
end
