class Admin::EventsController < AdminController

  def index
    if (params[:view] == nil)
      @events = Event.recent
    else
      @events = Event.all(:order => :start_at)
    end
  end
  
  def new
    @categories = EventCategory.all
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event])   
    if @event.save
      redirect_to admin_events_url, :notice => "Event was successfully created."
    else
      @categories = EventCategory.all
      render :action => "new"
    end
  end
  
  def edit
    @categories = EventCategory.all
    @event = Event.find(params[:id])    
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to admin_events_url, :notice => "Event was successfully updated."
    else
      @categories = EventCategory.all
      render :action => "edit"
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    begin
      @event.destroy
      flash[:notice] = "Event #{@event.name} deleted"
    rescue Exception => e
      flash[:notice] = e.message
    end
    
    respond_to do |format|
      format.html { redirect_to(admin_events_url) }
      format.xml  { head :ok }
    end
  end

end