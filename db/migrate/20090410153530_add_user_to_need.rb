class AddUserToNeed < ActiveRecord::Migration
  def self.up
    add_column :needs, :user_id, :integer
  end

  def self.down
    remove_column(:needs, :user_id)
  end
end
