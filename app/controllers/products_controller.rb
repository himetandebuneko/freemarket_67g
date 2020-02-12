class ProductsController < ApplicationController
  before_action :set_image
  def index
    @products = Product.last(10)
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @parents = Category.all.order("id ASC").limit(13)
    @product = Product.new
    @product.images.build
  end

  
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        params[:images][:image].each do |image|
          @product.images.create(image: image, product_id: @product.id)
        end
        format.html{redirect_to root_path}
      else
        @product.images.build
        format.html{render action: 'new'}
      end
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
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
  end

  def confirm

  end

  def show
    @product = Product.find(params[:id])
    #現時点では値が取得できないためfind(1)で仮置き
    #Product.find(params[:id])に変更する
  end

private

  def product_params
    params.require(:product).permit(:name, :detail, :size, :price, :condition, :shippingaddress, :shippingdate,  images_attributes: [:image, :_destroy, :id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_image
    @images = Image.last(10)
  end
  
end
