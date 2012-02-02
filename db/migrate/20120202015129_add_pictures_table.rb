class AddPicturesTable < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string    :name,                :null => false
      t.integer   :order,               :null => false
      t.integer   :album_id,            :null => false
      
      t.string    :photo_file_name,     :null => false
      t.string    :photo_content_type,  :null => false
      t.integer   :photo_file_size,     :null => false
      t.datetime  :photo_updated_at,    :null => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
