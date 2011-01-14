class Admin::EventsController < AdminController

  def index
    @events = Event.all(:order => :start_at)
  end
  
  def new
    @event = Event.new
  end
  
  def create
     @event = Event.new(params[:event])

      if @event.save
        redirect_to(admin_events_url, :notice => "Event was successfully created.")
      else
        render :action => :new
      end
  end

end