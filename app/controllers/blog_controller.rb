class BlogController < ApplicationController
  
  def index
    #need to update this so it will only return posts and categories from appropriate posts (members_only)
    @posts = Post.paginate :per_page => 5, :page => params[:page], :order => 'published_at DESC'
    @categories = Category.find(:all, :order => "name")
  end
  
  def show
    @post = Post.find_by_slug(params[:slug])    
    @categories = Category.find(:all, :order => "name")
    if !@post
      render "404"
    end
  end
  
end