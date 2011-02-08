class CreateConversations < ActiveRecord::Migration
  def self.up
    create_table :conversations do |t|
      t.integer :id
      t.string :title, :limit => 255
      t.integer :user_id
      t.integer :views

      t.timestamps
    end
    add_index :conversations, :user_id
  end

  def self.down
    drop_table :conversations
  end
end
