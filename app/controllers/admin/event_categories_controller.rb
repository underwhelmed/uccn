class Admin::EventCategoriesController < AdminController
  
  def index
    @categories = EventCategory.all
  end
  
end