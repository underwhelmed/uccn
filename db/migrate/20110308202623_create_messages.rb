class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :name,     :null => false
      t.string :email,    :null => false
      t.string :phone
      t.string :message,  :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
