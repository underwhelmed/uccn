class Admin::PostsController < AdminController
  
  def index    
    @posts = Post.all
  end
  
  def new
    @post = Post.new
    @post.published_at = Time.now
    @categories = Category.all
  end
  
  def create
    @post = Post.new(params[:post])   
    @post.author = current_user.name
    if @post.save
      redirect_to admin_posts_url, :notice => "Blog Post was successfully created."
    else
      render :action => "new"
    end
  end
  
  def edit
    @post = Post.find(params[:id])    
  end
  
  def update
    params[:post][:category_ids] ||= []  #added in case all categories were removed
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to admin_posts_url, :notice => "Blog Post was successfully updated."
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    begin
      @post.destroy
      flash[:notice] = "Blog Post was successfully deleted"
    rescue Exception => e
      flash[:notice] = e.message
    end
    
    respond_to do |format|
      format.html { redirect_to(admin_posts_url) }
      format.xml  { head :ok }
    end
  end
  
end