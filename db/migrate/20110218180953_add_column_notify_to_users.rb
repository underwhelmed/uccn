class AddColumnNotifyToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :notify_on_new_post, :boolean, :default => false, :null => false
  end

  def self.down
    remove_column :users, :notify_on_new_post
  end
end
