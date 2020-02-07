class ProductsController < ApplicationController
  def index
    @products = Product.last(10)
  end

  def new
    @parents = Category.all.order("id ASC").limit(13)
  end

  def confirm
  
  end

end
