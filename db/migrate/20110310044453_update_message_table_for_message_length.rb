class UpdateMessageTableForMessageLength < ActiveRecord::Migration
  def self.up
    remove_column :messages, :message
        remove_column :messages, :messages, :text
  end

  def self.down
    remove_column :messages, :message
    add_column :messages, :message, :string
  end
end
