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
  end

  private

  def order_params
    params.require(:user).permit(:first_name, :family_name, :first_name_kana, :family_name_kana, :nickname)
  end
end
