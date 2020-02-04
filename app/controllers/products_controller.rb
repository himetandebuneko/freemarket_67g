class ProductsController < ApplicationController
  def index
    @product = Product.last(10)
  end
end
