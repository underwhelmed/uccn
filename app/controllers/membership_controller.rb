class MembershipController < ApplicationController
  before_filter :authenticate_user!, :only => [:view, :index, :destroy]
  before_filter :validate_admin, :only => [:index, :destroy]
  
  def index
    @memberships = Membership.all
  end
  
  def new
    @membership = Membership.new
  end
  
  def create
    @membership = Membership.new(params[:membership])   
    @membership.ip_address = request.remote_ip    
    if @membership.save
      respond_to do |format|
        Notifier.send_new_membership_application(@membership).deliver
        format.html { redirect_to membership_success_url }
      end
    else
      render :action => "new"
    end
  end
  
  def destroy
     @membership = Membership.find(params[:id])
      begin
        @membership.destroy
        flash[:notice] = "Membership application request deleted"
      rescue Exception => e
        flash[:notice] = e.message
      end

      respond_to do |format|
        format.html { redirect_to view_memberships_path }
        format.xml  { head :ok }
      end
  end
  
  def success
  end
  
  def view
    @membership = Membership.find_by_token(params[:token])
    redirect_to view_memberships_path if @membership == nil
    @membership
  end
  
end