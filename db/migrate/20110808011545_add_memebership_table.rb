class AddMemebershipTable < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.string :first_name,     :null => false
      t.string :last_name,      :null => false
      t.string :business_name,  :null => false
      t.string :address_1,      :null => false
      t.string :address_2,      :null => false
      t.string :city,           :null => false
      t.string :state,          :null => false
      t.string :postal_code,    :null => false
      t.string :email,          :null => false
      t.string :phone_number,   :null => false
      t.string :date_of_birth,  :null => false
      t.string :ip_address,     :null => false
     
      t.timestamps
    end
  end

  def self.down
    drop_table :memberships
  end
end
