class ChangeLengthOfExcerptField < ActiveRecord::Migration
  def self.up
    change_column :posts, :excerpt, :string, :limit => 10000
  end

  def self.down
    change_column :posts, :excerpt, :string, :limit => 255
  end
end
