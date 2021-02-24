class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_product, only: [:edit, :update, :show]
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

  def edit
     unless current_user.id == @product.user.id
       redirect_to products_path
      end 
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if current_user.id == @product.user_id
      if @product.destroy
        redirect_to products_path
      end
    end
  end

  def show
    
  end


  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :detail,:category_id,:status_id, :delivery_fee_id,
      :area_id, :delivery_date_id, :image).merge(user_id: current_user.id)
  end
end
