class ItemsController < ApplicationController

  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :image, :price, :category_id, :status, :payment, :place, :days).marge(user_id: crrent_user.id)
  end
end
