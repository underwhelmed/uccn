class Admin::EventCategoriesController < AdminController
  
  def index
    @categories = EventCategory.all
  end
  
  def new
     @category = EventCategory.new
   end

   def create
     @category = EventCategory.new(params[:event_category])   
     if @category.save
       redirect_to admin_event_categories_url, :notice => "Event Category was successfully created."
     else
       render :action => "new"
     end
   end

   def edit
     @category = EventCategory.find(params[:id])    
   end

   def update
     @category = EventCategory.find(params[:id])
     if @category.update_attributes(params[:event_category])
       redirect_to admin_event_categories_url, :notice => "Event Category was successfully updated."
     else
       render :action => "edit"
     end
   end

   def destroy
     @category = EventCategory.find(params[:id])
     begin
       @category.destroy
       flash[:notice] = "Event Category deleted"
     rescue Exception => e
       flash[:notice] = e.message
     end

     respond_to do |format|
       format.html { redirect_to(admin_event_categories_url) }
       format.xml  { head :ok }
     end
   end
  
end