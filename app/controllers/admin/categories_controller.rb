class Admin::CategoriesController < AdminController

def index
  @categories = Category.all
  @category = Category.new
end

end