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
      redirect_to(users_url, :notice => 'User #{@user.name} was successfully created.')
    else
      render :action => "new"
    end
  end
  
end