class EventCategory < ActiveRecord::Base
  has_and_belongs_to_many :events
  
  attr_accessible :name, :color
end
