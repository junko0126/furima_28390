class OrdersController < ApplicationController
  def index
  end

  # def new
  #   if @user = User.new
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  def create
    @order = Order.new(price: order_params[:price])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
  end

  private

  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = "sk_test_02db5bbd8f074d0e5724c63a"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
