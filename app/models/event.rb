class Event < ActiveRecord::Base
  has_event_calendar
  
  validates_presence_of :name, :description, :start_at
  
  attr_accessible :name, :description, :start_at, :members_only, :all_day, :end_at
end
