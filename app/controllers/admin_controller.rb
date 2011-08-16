class AdminController < ApplicationController
  before_filter :authenticate_user! 
  before_filter :validate_admin
  layout 'admin'
  
  def index
    
  end
  
  def email
    
  end  
  
  def send_email
    logger.info "Email body: #{params[:body]}"
    if params[:subject].empty? || params[:body].empty?
      flash[:notice] = "Please enter a Subject and Body for this email"
      render 'email'
    else
      User.for_email_blast.each do |u|
        Notifier.delay.send_member_emails(u.email, params[:subject], current_user.email, params[:body])
      end
      flash[:notice] = "Your emails were successfully sent"
      redirect_to :action => :email_sent
    end
  end
  
  def email_sent
  end
  
end