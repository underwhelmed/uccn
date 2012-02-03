class GalleryController < ApplicationController
  
  def index
    if (user_signed_in?)
      @albums = Album.all
    else
      @albums = Album.where(:public => true)
    end
  end
  
  def view
    @album = Album.find_by_slug(params[:slug])
    if (@album.nil? || @album.pictures.count == 0 || (!user_signed_in? && !@album.public?)) 
      redirect_to gallery_path
    end
  end
  
end