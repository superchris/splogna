class CreateNeed < ActiveRecord::Migration
  def self.up
    create_table :needs do |t|
      t.string :title
      t.string :description
    end
  end

  def self.down
    drop_table(:needs)
  end
end
