class AddCategoryColumnToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :event_category_id, :integer
  end

  def self.down
    remove_column :events, :event_category_id
  end
end
