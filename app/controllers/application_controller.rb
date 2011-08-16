class ApplicationController < ActionController::Base
  protect_from_forgery
 
  def validate_admin 
    redirect_to root_path, :notice => 'You are not authorized to view this page' if current_user.nil? or !current_user.account_active or !current_user.admin 
  end
   
end
