class Admin::UsersController < ApplicationController
  #before_filter :admin_required
  layout 'admin'
  
  def index
    @users = User.all()
  end
  
end