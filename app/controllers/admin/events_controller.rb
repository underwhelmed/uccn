class Admin::EventsController < AdminController

  def index
    @events = Event.all(:order => :start_at)
  end
  
  def new
    @event = Event.new
  end
  
  def create
    
  end

end