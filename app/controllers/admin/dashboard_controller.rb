class Admin::DashboardController < ApplicationController

  name = ENV['NAME']
  password = ENV['PASSWORD']

  http_basic_authenticate_with name: name, password: password

  def show
    @total_products = Product.count
    @total_categories = Category.count
  end
end
