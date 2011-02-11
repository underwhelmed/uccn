class Admin::DocumentsController < AdminController
  
  def index
    @documents = Document.all
  end
  
  def new
    @document = Document.new
  end
  
  def create
    @document = Document.new( params[:document] )
    if @document.save
      redirect_to admin_documents_url, :notice => "Document was successfully created."
    else
      render :action => "new"
    end
  end  
  
  def edit
    @document = Document.find(params[:id])
  end
  
  def update
     @document = Document.find(params[:id])
      if @document.update_attributes(params[:document])
        redirect_to admin_documents_url, :notice => "Document was successfully updated."
      else
        render :action => "edit"
      end
  end
  
  def destroy
     @document = Document.find(params[:id])
      begin
        @document.destroy
        flash[:notice] = "Document Successfully Deleted"
      rescue Exception => e
        flash[:notice] = e.message
      end

      respond_to do |format|
        format.html { redirect_to(admin_documents_url) }
        format.xml  { head :ok }
      end
  end
end