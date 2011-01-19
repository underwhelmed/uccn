class Admin::OpeningsController < AdminController
  
  def index
    @openings = Opening.all
  end
  
  def new
    @opening = Opening.new
  end
  
  def create
    @opening = Opening.new(params[:opening])   
    if @opening.save
      redirect_to admin_openings_url, :notice => "Daycare Opening was successfully created."
    else
      render :action => "new"
    end
  end
  
  def edit
    @opening = Opening.find(params[:id])    
  end
  
  def update
    @opening = Opening.find(params[:id])
    if @opening.update_attributes(params[:opening])
      redirect_to admin_openings_url, :notice => "Daycare Opening was successfully updated."
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @opening = Opening.find(params[:id])
    begin
      @opening.destroy
      flash[:notice] = "Daycare Opening #{@openings.name} deleted"
    rescue Exception => e
      flash[:notice] = e.message
    end
    
    respond_to do |format|
      format.html { redirect_to(admin_openings_url) }
      format.xml  { head :ok }
    end
  end
  
end