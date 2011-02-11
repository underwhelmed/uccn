class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :name, :limit => 100
      t.string :description, :limit => 255
      t.boolean :allow_download, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
