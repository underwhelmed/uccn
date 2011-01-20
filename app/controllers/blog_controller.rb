class BlogController < ApplicationController
  
  def index
    @posts = Post.paginate :per_page => 5, :page => params[:page], :order => 'published_at DESC'
  end
  
end