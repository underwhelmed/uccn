class AddCategoryColumnToEvents < ActiveRecord::Migration
  def self.up
    create_table :event_categories do |t|
      t.integer :id, :null => false
      t.string :name, :null => false
      t.string :color, :null => false
      t.timestamps
    end
    e = EventCategory.new
    e.name = 'Field Trip'
    e.color = '#F9F9F9'
    e.save!

    add_column :events, :event_category_id, :integer
  end

  def self.down
    EventCategory.delete_all
    drop_table :event_categories
    remove_column :events, :event_category_id
  end
end
