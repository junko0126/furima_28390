class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :image, :content, :price, :category_id, :status_id, :prefecture_id, :payment_id, :days_id
    ).merge(user_id: current_user.id)
  end
end
