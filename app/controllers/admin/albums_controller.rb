class Admin::AlbumsController < AdminController
  
  def index
    @albums = Album.all
  end
  
  def new
    @album = Album.new
    3.times { @album.pictures.build }    
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
    3.times { @album.pictures.build }    
  end
  
  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      redirect_to admin_albums_url, :notice => "Photo Album was successfully updated."
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    flash[:notice] = "Successfully deleted album."
    redirect_to admin_albums_url
  end

end