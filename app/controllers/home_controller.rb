class HomeController < ApplicationController
  
  def index

  end
  
  def boxylightblue
    render :layout =>  "boxy_lg_blue"  
  end
  
  def boxylightred
    render :layout =>  "boxy_lg_red"  
  end
  
  
end
