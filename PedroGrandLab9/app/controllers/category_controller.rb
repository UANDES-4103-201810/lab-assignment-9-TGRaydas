class CategoryController < ApplicationController
  def index
    @categories = Category.all
  end
  def new

  end
  def create
    name = params[:name]
    description = params[:description]
    category = Category.create(name:name, description:description)
    if category.save
      flash[:notice] = "The category was created"
      redirect_to '/categories'
    end
  end
end
