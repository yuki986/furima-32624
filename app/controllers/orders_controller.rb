class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_product, only: [:index, :create]
  before_action :set_conditional_branch,  only: [:index, :create]
  def index
    @how_to_buy = HowToBuy.new
  end

  def create
    @how_to_buy = HowToBuy.new(how_to_buy_params)
    if @how_to_buy.valid?
      pay_product
      @how_to_buy.save
      redirect_to root_path
    else
      # orderのindexへ行く
      render action: :index
    end
  end

  private
  def set_product
    @product = Product.find(params[:product_id])
  end
  
  def set_conditional_branch
    if current_user.id == @product.user.id || @product.order != nil
      redirect_to products_path
    end
  end

  def how_to_buy_params
    params.require(:how_to_buy).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 秘密鍵
    Payjp::Charge.create(
      amount: @product.price,  # 商品の値段
      card: how_to_buy_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
