class ItemsController < ApplicationController

  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    if @item = Item.new
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :image, :price, :category_id, :status_id, :prefecture_id, :payment_id, :days_id).marge(user_id: crrent_user.id)
  end
end
