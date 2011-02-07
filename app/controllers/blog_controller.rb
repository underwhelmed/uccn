class BlogController < ApplicationController
  
  def index
    
    @categories = Category.find(:all, :order => "name")
    if (!params[:slug].nil?)
      @category = Category.find_by_slug(params[:slug])
      if (user_signed_in?)
        @posts = Post.published_for_members.joins(:categories).where(:categories => {:slug => params[:slug] }).paginate :per_page => 5, :page => params[:page], :order => 'published_at DESC'
      else
        @posts = Post.published.paginate :per_page => 5, :page => params[:page], :order => 'published_at DESC'
      end
    else
      if (user_signed_in?)
        @posts = Post.published_for_members.paginate :per_page => 5, :page => params[:page], :order => 'published_at DESC'
      else
        @posts = Post.published.paginate :per_page => 5, :page => params[:page], :order => 'published_at DESC'
      end
    end
  end
  
  def show
    @post = Post.find_by_slug(params[:slug])
    if (!@post.nil? && @post.status == 2 && (!@post.members_only || (user_signed_in? && @post.members_only)) && @post.published_at <= Time.zone.now)
      @categories = Category.find(:all, :order => "name")      
    else
      render "404"
    end
  end
  

  
end