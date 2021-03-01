class OrdersController < ApplicationController
  def index
    @how_to_buy = HowToBuy.new
    @product = Product.find(params[:product_id])
  end

  def create
    @how_to_buy = HowToBuy.new(how_to_buy_params)
    if @how_to_buy.valid?
      @how_to_buy.save
      redirect_to root_path
    else
      # orderのindexへ行く
      render action: :index
    end
    redirect_to "/products/#{@order.product_id}"
  end

  private
  def how_to_buy_params
    params.require(:how_to_buy).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
