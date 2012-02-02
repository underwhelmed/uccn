class Admin::AlbumsController < AdminController
  
  def index
    @albums = Album.all
  end
  
  def new
    @album = Album.new
    3.times {@album.pictures.build}
  end
  
  def edit
    @album = Album.find(params[:id])
    3.times {@album.pictures.build}
  end

end