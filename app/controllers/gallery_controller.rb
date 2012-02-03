class GalleryController < ApplicationController
  
  def index
    if (user_signed_in?)
      @albums = Album.all
    else
      @albums = Album.where(:public => true)
    end
  end
  
  def view
    if (params[:slug].nil? || Album.find_by_slug(params[:slug]).nil? || Album.find_by_slug(params[:slug]).pictures.count == 0) 
      redirect_to gallery_path
    else
      @album = Album.find_by_slug(params[:slug])
    end
  end
  
end