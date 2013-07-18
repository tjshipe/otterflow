class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to category_path(category), notice: "Catottergry created!"
    else
      render 'new', flash: "Try again!"
    end
  end
end
