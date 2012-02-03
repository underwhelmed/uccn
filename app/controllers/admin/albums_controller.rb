class Admin::AlbumsController < AdminController
  
  def index
    @albums = Album.all
  end
  
  def new
    @album = Album.new
  end
  
  def create
    @album = Album.new( params[:album] )
    if @album.save
      redirect_to admin_albums_url, :notice => "Photo Album was successfully created."
    else
      render :action => "new"
    end
  end
  
  def edit
    @album = Album.find(params[:id])    
  end
  
  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      redirect_to admin_albums_url, :notice => "Photo Album was successfully updated."
    else
      render :action => "edit"
    end
  end

end