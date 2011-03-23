class OpeningsController < ApplicationController
  
  def index
    @openings = Opening.order("city").all
  end
  
  def choosing_a_provider
    
  end
  
end