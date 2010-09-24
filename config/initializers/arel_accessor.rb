class ActiveRecord::Base
  def self.[](column)
    arel_table[column]
  end
end