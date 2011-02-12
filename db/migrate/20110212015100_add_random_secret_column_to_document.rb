class AddRandomSecretColumnToDocument < ActiveRecord::Migration
  def self.up
    add_column :documents, :random_secret, :string
  end

  def self.down
    remove_column :documents, :random_secret
  end
end
