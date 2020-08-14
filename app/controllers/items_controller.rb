class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @item = Item.create(item_params)
    @item.save
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:item)
  end
end
