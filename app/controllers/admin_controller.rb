class AdminController < ApplicationController
  before_filter :authenticate_user! 
  before_filter :validate_admin
  layout 'admin'
  
  def index
    
  end
  
  def validate_admin 
    redirect_to root_path if current_user.nil? or !current_user.admin 
  end
  
end