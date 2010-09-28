module Searchable

  def search(term)
    query_term = "%#{term}%"
    where(self[:title].matches(query_term).or(self[:description].matches(query_term)))
  end
  
end