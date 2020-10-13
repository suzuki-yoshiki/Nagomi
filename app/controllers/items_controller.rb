class ItemsController < ApplicationController

  def index
    @items = Item.all
    @cart_item = CartItem.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render @item.current_cart
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :profile_image, :price)
  end
end
