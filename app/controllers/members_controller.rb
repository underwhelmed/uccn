class MembersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @birthdays = User.upcoming_birthdays
    @events = Event.upcoming
    @new_members = User.new_members
  end
  
  def directory
    @users = User.member_directory
  end
  
  def profile
    @user = current_user
    render :layout => "app_admin"
  end
  
  def update_profile
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to(profile_path, :notice => "Your profile was successfully updated.") 
    else
      render :action => :profile 
    end
  end
  
  def officers
  end
  
  def board
  end
  
  def advisory
  end
  
  def downloads
    @documents = Document.active.order("updated_at DESC")
  end
  
  def download
    doc = Document.find(params[:id])
    if current_user.admin? || doc.allow_download
      redirect_to doc.authenticated_s3_get_url
    end    
  end
  
end