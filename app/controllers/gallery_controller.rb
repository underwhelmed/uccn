class GalleryController < ApplicationController
  
  def index
    if (user_signed_in?)
      @albums = Album.all
    else
      @albums = Album.find_by_public(true)
    end
  end
  
  def view
    if (params[:name].nil? || Album.find_by_name(params[:name]).nil?)
      render index
    else
      @album = Album.find_by_name(params[:name])
    end
  end
  
end