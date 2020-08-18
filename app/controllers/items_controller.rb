class ItemsController < ApplicationController

  def index
  end
  
  def new
    @item = Item.new

  def create
    @item = Item.create(item_params)
    @item.save
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :image, :price, :category, :status, :payment, :place, :days).marge(user_id: crrent_user.id)
  end
end
