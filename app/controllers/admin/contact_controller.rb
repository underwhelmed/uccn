class Admin::ContactController < AdminController
  
  def index
    @messages = Message.all
  end
  
  def destroy
    @message = Message.find(params[:id])
    begin
      @message.destroy
      flash[:notice] = "Message from #{@openings.name} deleted"
    rescue Exception => e
      flash[:notice] = e.message
    end
    
    respond_to do |format|
      format.html { redirect_to(admin_messages_url) }
      format.xml  { head :ok }
    end
  end
  
end