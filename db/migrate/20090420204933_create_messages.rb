class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :subject
      t.text :body
      t.integer :response_to_id
      t.string :response_to_type
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
