class Admin::EventsController < AdminController

  def index
    @events = Event.all(:order => :start_at)
  end

end