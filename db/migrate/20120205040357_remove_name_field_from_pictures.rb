class RemoveNameFieldFromPictures < ActiveRecord::Migration
  def self.up
    remove_column :pictures, :name
  end

  def self.down
    add_column :pictures, :name, :string    
  end
end
