class AddIpAddressToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :ip_address, :string
  end

  def self.down
    remove_column :messages, :ip_address
  end
end
