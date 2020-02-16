class ProductsController < ApplicationController
  before_action :set_image
  before_action :set_product, only:["destroy","show"]

  def index
    @product = Product.last(10)
    @products = Product.includes(:images).where(buyer: "").limit(10).order('created_at DESC')
  end

  def new
    @category = Category.where(ancestry: nil).each do |parent|
    end
    @product = Product.new
    @product.images.build
  end

  def category_children  
    @category_children = Category.find(params[:productcategory]).children 
  end

  def category_grandchildren
    @category_grandchildren = Category.find(params[:productcategory]).children
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
    if @product.destroy
      redirect_to root_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def confirm
    @product = Product.find(params[:id])
    @card = Credit.find_by(user_id: current_user.id)
  end

  def show
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
