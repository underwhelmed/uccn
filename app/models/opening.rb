class Opening < ActiveRecord::Base
  validates_presence_of :name, :description
  
  attr_accessible :name, :description, :phone, :email, :city, :school_district, :created_at, :updated_at
end
