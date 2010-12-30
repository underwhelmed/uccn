class MembersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end
  
  def directory
    @users = User.all()
  end
  
  def profile
  end
  
end