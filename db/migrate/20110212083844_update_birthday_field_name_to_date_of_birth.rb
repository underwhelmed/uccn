class UpdateBirthdayFieldNameToDateOfBirth < ActiveRecord::Migration
  def self.up
    rename_column :users, :birthday, :date_of_birth
  end

  def self.down
    rename_column :users, :date_of_birth, :birthday
  end
end