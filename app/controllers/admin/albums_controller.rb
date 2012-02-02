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

end