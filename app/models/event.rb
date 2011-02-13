class Event < ActiveRecord::Base
  has_event_calendar
  
  has_one :event_category
  
  validates_presence_of :name, :description, :start_at, :end_at, :event_category_id
  
  attr_accessible :name, :description, :start_at, :members_only, :all_day, :end_at, :event_category_id
  
  validate :start_at_and_end_date_valid
  
  scope :upcoming, lambda {
    where("start_at <= ?", 1.day.ago)
  }
  
  def self.event_strips_for_month_for_members(month, member)
    if (member == true)
      self.event_strips_for_month month    
    else
      self.event_strips_for_month month, :conditions => 'members_only = "f"'
    end
  end
  
  def self.events_by_date(date, member)
    begin_date = date.beginning_of_day.utc
    end_date = date.end_of_day.utc
    sql = "((all_day = 't' AND date(start_at) = ?) OR (start_at BETWEEN ? AND ? AND all_day = 'f'))"
    if (member == true)
      self.all(:conditions => [sql, date, begin_date, end_date])
    else
      self.all(:conditions => [sql + " AND members_only = 'f'", date, begin_date, end_date])
    end
  end

  private
    def start_at_and_end_date_valid    
      if self.all_day?
        self.start_at = self.start_at.to_date
        self.end_at = self.end_at.to_date
      end
      if !self.start_at.nil? && !self.end_at.nil?
        errors[:base] = "Please set a valid end time for this event" unless (self.start_at < self.end_at) || (self.all_day && self.start_at <= self.end_at)
      end
    end
end
