class RemoveLastLoginDateFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :last_login_date
  end

  def self.down
    add_column :users, :last_login_date, :datetime
  end
end
