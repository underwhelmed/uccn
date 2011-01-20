class MembersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end
  
  def directory
    @users = User.where(:active => true, :include_in_directory => true)
  end
  
  def profile
  end
  
  def officers
  end
  
  def board
  end
  
  def advisory
  end
  
end