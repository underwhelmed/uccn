class OpeningsController < ApplicationController
  
  def index
    @openings = Opening.all
  end
  
end