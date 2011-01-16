class Event < ActiveRecord::Base
  has_event_calendar
  
  validates_presence_of :name, :description, :start_at, :end_at, :members_only, :all_day
  
  attr_accessible :name, :description, :start_at, :members_only, :all_day, :end_at
  
  validate :start_at_and_end_date_valid

  private
    def start_at_and_end_date_valid    
      errors.add(:start_at, 'Please set a valid end time for this event') 
    end
end
