class RemoveFieldsFromUser < ActiveRecord::Migration
  def self.up
    #remove_column :users, :email_address
  end

  def self.down
    #add_column :users, :email_address, :string
  end
end
