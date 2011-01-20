class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|

      t.string :slug, :null => false
      t.string :title, :null => false
      t.datetime :published_at
      t.string :excerpt
      t.text :body, :null => false
      t.string :author
      t.boolean :published, :default => false
      t.boolean :members_only, :default => false
      t.integer :id

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
