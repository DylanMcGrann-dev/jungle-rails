class Admin::CategoriesController < ApplicationController
  def new
    @category = Category.new
  end
  def index
    @categories = Category.all
  end
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'category created!'
    else
      render :new
    end
  end
  def category_params
    params.require(:category).permit(
      :name
    )
  end
end