class AddSlugToAlbums < ActiveRecord::Migration
  def self.up
    add_column :albums, :slug, :string
  end

  def self.down
    remove_column :albums, :slug
  end
end
