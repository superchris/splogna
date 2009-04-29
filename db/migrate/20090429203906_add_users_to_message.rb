class AddUsersToMessage < ActiveRecord::Migration
  def self.up
    rename_column(:messages, :user_id, :from_user_id)
    add_column :messages, :to_user_id, :integer, :null => false
  end

  def self.down
    remove_column(:messages, :to_user_id)
    rename_column(:messages, :from_user_id, :user_id)
  end
end
