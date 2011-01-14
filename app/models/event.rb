class Event < ActiveRecord::Base
  has_event_calendar
  
  validates_presence_of :name, :description, :start_at, :members_only, :all_day
  
  attr_accessible :name, :description, :start_at, :members_only, :all_day, :start_at, :end_at
end
