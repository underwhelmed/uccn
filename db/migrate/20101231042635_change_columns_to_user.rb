class ChangeColumnsToUser < ActiveRecord::Migration
  def self.up
    change_column_default :users, :active, true
    change_column_default :users, :admin, false
    change_column_default :users, :board_member, false
    change_column_default :users, :receive_emails, true
    change_column_default :users, :include_in_directory, true
    change_column_default :users, :display_address_in_directory, true        
    change_column_default :users, :display_phone_in_directory, true
    change_column_default :users, :backup_care, false
  end

  def self.down
    change_column_default :users, :board_member, nil
    change_column_default :users, :admin, nil
    change_column_default :users, :receive_emails, nil
    change_column_default :users, :receive_emails, nil
    change_column_default :users, :include_in_directory, nil
    change_column_default :users, :display_address_in_directory, nil        
    change_column_default :users, :display_phone_in_directory, nil
    change_column_default :users, :backup_care, nil
  end
end
