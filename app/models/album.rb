class Album < ActiveRecord::Base
  has_many :pictures, :dependent => :destroy
  accepts_nested_attributes_for :pictures, :allow_destroy => true
  
  validates_presence_of :name, :description, :public 
  attr_accessible :name, :description, :public
end
