class Admin::CategoriesController < AdminController

  def index
    @categories = Category.all
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])   
    if @category.save
      redirect_to admin_categories_url, :notice => "Category was successfully created."
    else
      @categories = Category.all
      render :action => 'index'
    end
  end
  
  def destroy
     @categories = Category.find(params[:id])
      begin
        @categories.destroy
        flash[:notice] = "Category deleted"
      rescue Exception => e
        flash[:notice] = e.message
      end

      respond_to do |format|
        format.html { redirect_to(admin_categories_url) }
        format.xml  { head :ok }
      end
  end

end