class Admin::CategoriesController < ApplicationController

  name = ENV['NAME']
  password = ENV['PASSWORD']

  http_basic_authenticate_with name: name, password: password

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(product_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:category).permit(
      :name,

    )
  end

end
