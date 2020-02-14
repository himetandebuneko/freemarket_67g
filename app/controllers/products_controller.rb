class ProductsController < ApplicationController
  before_action :set_image
  before_action :set_product, only:["destroy", "show", "edit"]

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
    product = Product.find(params[:id])
    if product.update(product_params)
       redirect_to root_path
    else
      render action: :index
    end
  end
  
  def destroy
    if @product.destroy
      redirect_to root_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def confirm

  end

  def show
  end

private

  def product_params
    params.require(:product).permit(:name, :detail, :size, :price, :condition, :shippingaddress, :shippingdate, images_attributes: [:image, :_destroy, :id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_image
    @images = Image.last(10)
  end
  
end
