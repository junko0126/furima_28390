class OrdersController < ApplicationController
  before_action :limit_user, only: [:index]

  def index
    @order = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order =  OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      # binding.pry
      @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.permit(:token, :prefecture_id, :postal_code, :city, :house_number, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_02db5bbd8f074d0e5724c63a"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  
  def limit_user
    @item = Item.find(params[:item_id])
    if current_user.id = @item.user_id
      redirect_to new_user_session_path
    end
  end
end
