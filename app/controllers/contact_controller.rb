class ContactController < ApplicationController
  
  def index
    
  end
  
  def create    
    Notifier.user_feedback(params[:message]).deliver
    redirect_to contact_success_path, :notice => 'Thanks for your feedback!'
  end
  
  def success
    
  end
  
end