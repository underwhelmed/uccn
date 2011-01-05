class ContactController < ApplicationController
  
  def index
    
  end
  
  def create
    
    redirect_to contact_success_path, :notice => 'Thanks for your feedback!'
  end
  
  def success
    
  end
  
end