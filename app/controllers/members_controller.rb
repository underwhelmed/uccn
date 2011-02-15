class MembersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @birthdays = User.member_directory.where("date_of_birth is not null").sort_by(&:next_birthday).first(8)
    @events = Event.upcoming_for_members
    @new_members = User.new_members
    @comments = Comment.all(:order => "created_at DESC", :limit => 5)
    @posts = Post.published_for_members.order("published_at DESC").limit(5)
  end
  
  def directory
    @users = User.member_directory.order(:last_name)
    respond_to do |format|
      format.html
      format.pdf { 
        p = PDFKit.new(members_directory_url, :print_media_type => true)
        send_data(p.to_pdf)
      }
     end
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
    @users = User.board
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
  
  def profiles
    @users = User.with_profile
  end
  
  def showprofile
    @user = User.find(params[:id])
  end
  
end