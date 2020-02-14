class ProductsController < ApplicationController
  before_action :set_image
  def index
    @products = Product.last(10)
    @product = Product.includes(:images).order('created_at DESC')
  end

  def new
    @parents = Category.all.order("id ASC").limit(13)
    @product = Product.new
    @product.images.build
  end

  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
    @product.destroy
    redirect_to root_path
  end

  def confirm

  end

  def show
    @product = Product.find(1)
    #現時点では値が取得できないためfind(1)で仮置き
    #Product.find(params[:id])に変更する
  end

private

  def product_params
    params.require(:product).permit(:name, :detail, :category_id, :size, :condition, :payer, :shippingaddress, :shippingdate, :price, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_image
    @images = Image.last(10)
  end
  
end
