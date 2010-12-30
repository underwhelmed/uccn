class AddFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :board_title, :string
    add_column :users, :receive_emails, :boolean
    add_column :users, :include_in_directory, :boolean
    add_column :users, :display_address_in_directory, :boolean
    add_column :users, :display_phone_in_directory, :boolean
    add_column :users, :backup_care, :boolean
    add_column :users, :biography, :text
    add_column :users, :picture_url, :string
  end

  def self.down
    remove_column :users, :picture_url
    remove_column :users, :biography
    remove_column :users, :backup_care
    remove_column :users, :display_phone_in_directory
    remove_column :users, :display_address_in_directory
    remove_column :users, :include_in_directory
    remove_column :users, :receive_emails
    remove_column :users, :board_title
  end
end
