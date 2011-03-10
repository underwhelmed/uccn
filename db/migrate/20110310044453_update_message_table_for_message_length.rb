class UpdateMessageTableForMessageLength < ActiveRecord::Migration
  def self.up
    remove_column :messages, :message
    add_column :messages, :message, :text
  end

  def self.down
    remove_column :messages, :message
    add_column :messages, :message, :string
  end
end
