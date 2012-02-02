class Album < ActiveRecord::Base
  has_many :pictures
  accepts_nested_attributes_for :pictures, :allow_destroy => true
  
  attr_accessible :name, :description, :public
end
