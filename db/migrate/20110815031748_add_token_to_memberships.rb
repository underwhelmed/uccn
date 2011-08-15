class AddTokenToMemberships < ActiveRecord::Migration
  def self.up
    add_column :memberships, :token, :string
  end

  def self.down
    remove_column :memberships, :token
  end
end
