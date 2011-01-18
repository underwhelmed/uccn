class Admin::EventsController < AdminController

  def index
    @events = Event.all(:order => :start_at)
  end
  
  def new
    @categories = EventCategory.all
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event])
    if @event.all_day?
      @event.start_at = @event.start_at.to_date
      @event.end_at = @event.end_at.to_date
    end
    if @event.save
      redirect_to admin_events_url, :notice => "Event was successfully created."
    else
      @categories = EventCategory.all
      render :action => :new      
    end
  end

end