class MembershipController < ApplicationController
  
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
  
  def success
  end
  
  def view
    @membership = Membership.find_by_token(params[:token])
  end
  
end