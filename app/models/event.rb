class Event < ActiveRecord::Base
  has_event_calendar
  
  has_one :event_category
  
  validates_presence_of :name, :description, :start_at, :end_at, :event_category_id
  
  attr_accessible :name, :description, :start_at, :members_only, :all_day, :end_at, :event_category_id
  
  validate :start_at_and_end_date_valid

  private
    def start_at_and_end_date_valid    
      errors[:base] = "Please set a valid end time for this event" unless !self.start_at.nil? && !self.end_at.nil? && ((self.start_at < self.end_at) || (self.all_day && self.start_at <= self.end_at))
    end
end
