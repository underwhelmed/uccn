class Admin::UsersController < AdminController
  
  def index
    @users = User.all(:order => :login)
  end
  
  def new
     @user = User.new   
  end
  
  def create
    @user = User.new(params[:user])
       
    if @user.save
# might as well do this manually until I can figure out how to do this correctly
#      send = params[:send_welcome_email]
#      if send
#        UserMailer.welcome_email(@user).deliver
#      end
      redirect_to(admin_users_url, :notice => "User #{@user.name} was successfully created.")
    else
      render :action => "new", :notice => "Cannot save user"
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      redirect_to(edit_admin_user_path(@user), :notice => "User #{@user.name} was successfully updated.") 
    else
      render :action => :edit 
    end

  end
  
  def destroy
     @user = User.find(params[:id])
      begin
        @user.destroy
        flash[:notice] = "User #{@user.name} deleted"
      rescue Exception => e
        flash[:notice] = e.message
      end

      respond_to do |format|
        format.html { redirect_to(admin_users_url) }
        format.xml  { head :ok }
      end
  end
  
end