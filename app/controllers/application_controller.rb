class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
   def admin_required
     current_user.admin?
   end
end
