class BlogController < ApplicationController
  
  def index
    @posts = Post.paginate :per_page => 5, :page => params[:page], :order => 'published_at DESC'
  end
  
  def show
    @post = Post.find_by_slug(params[:slug])
    if !@post
      render "404"
    end
  end
  
end