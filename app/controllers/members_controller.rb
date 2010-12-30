class MembersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end
  
  def directory
  end
  
  def profile
  end
  
end