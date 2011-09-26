class ApplicationController < ActionController::Base
  protect_from_forgery
 
  def validate_admin 
    redirect_to root_path, :notice => 'You are not authorized to view this page' if current_user.nil? or !current_user.account_active or !current_user.admin 
  end
  
  def render_404
    respond_to do |format|
       format.html { render :file => "#{Rails.root}/public/404.html", :status => :not_found }
       format.xml  { head :not_found }
       format.any  { head :not_found }
     end
  end
   
end
