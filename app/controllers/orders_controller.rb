class OrdersController < ApplicationController
  def index
    @orders = Order.new
    @product = Product.find(params[:product_id])
  end

  def create
    @order = Order.new(order_params)
    redirect_to "/products/#{@order.product_id}"
  end

  private
  def order_params
    params.require(:order).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
