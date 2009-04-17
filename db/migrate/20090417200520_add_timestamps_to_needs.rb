class AddTimestampsToNeeds < ActiveRecord::Migration
  def self.up
    add_timestamps(:needs)
  end

  def self.down
    remove_timestamps(:needs)
  end
end
