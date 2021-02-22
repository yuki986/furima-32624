class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end
  private
  def product_params
    params.require(:product).permit(:name, :price, :detail,:category_id,:status_id, :delivery_fee_id,
      :area_id, :delivery_date_id, :image).merge(user_id: current_user.id)
  end
end

# @products = [a,a,a,a,]
#  Product
