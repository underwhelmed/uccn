class Admin::UsersController < ApplicationController
  #before_filter :admin_required
  layout 'admin'
  
  def index
    @users = User.all()
  end
  
  def new
     @user = User.new    
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to(admin_users_url, :notice => 'User #{@user.name} was successfully created.')
    else
      render :action => "new"
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        redirect_to(edit_admin_user_path(@user), :notice => 'User was successfully updated.') 
        format.xml  { head :ok }
      else
        format.html { render :action => :edit }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
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