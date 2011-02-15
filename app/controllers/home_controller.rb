class HomeController < ApplicationController
  
  def index
    if (user_signed_in?)
      @posts = Post.published_for_members.order('published_at DESC').limit(3)
      @events = Event.upcoming_for_members.order('start_at').limit(3)
    else
      @posts = Post.published.order('published_at DESC').limit(3)
      @events = Event.upcoming.order('start_at').limit(3)
    end
  end
  
  def about    
  end
  
  def join
  end
  
  def goals
  end
  
  def terms_of_use
    
  end
  
  def privacy_policy
    
  end
  
end
