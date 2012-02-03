class UpdateNameFieldInPictureTableToBeNullable < ActiveRecord::Migration
  def self.up
    change_column :pictures, :name, :string, :null => true
  end 

  def self.down
    change_column :pictures, :name, :string, :null => false
  end
end
