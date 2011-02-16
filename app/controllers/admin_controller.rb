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
        Notifier.send_member_emails(u.email, params[:subject], current_user.email, params[:body]).deliver
      end
      flash[:notice] = "Your emails were successfully sent"
      redirect_to :action => :email_sent
    end
  end
  
  def email_sent
  end
  
  private
  
    def validate_admin 
      redirect_to root_path, :notice => 'You are not authorized to view this page' if current_user.nil? or !current_user.account_active or !current_user.admin 
    end
  
end