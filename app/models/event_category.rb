class EventCategory < ActiveRecord::Base
  belongs_to :events
  
  attr_accessible :name, :color
end
