class RemoveRandomSecretFromDocuments < ActiveRecord::Migration
  def self.up
    remove_column :documents, :random_secret
  end

  def self.down
    add_column :documents, :random_secret, :string    
  end
end
