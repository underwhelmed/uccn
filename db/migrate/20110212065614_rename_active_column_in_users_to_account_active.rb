class RenameActiveColumnInUsersToAccountActive < ActiveRecord::Migration
  def self.up
    rename_column :users, :active, :account_active
  end

  def self.down
    rename_column :users, :account_active, :active
  end
end
