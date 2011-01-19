class CreateOpenings < ActiveRecord::Migration
  def self.up
    create_table :openings do |t|
      t.string :city
      t.string :school_district
      t.string :name
      t.string :phone
      t.string :email
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :openings
  end
end
