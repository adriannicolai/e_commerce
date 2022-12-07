class ProductsController < ApplicationController
  def index
  end

  def new
    @categories = Category.all
  end
end
