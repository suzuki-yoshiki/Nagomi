class ItemsController < ApplicationController
  before_action :setup_cart_item!

  def index
    @items = Item.all
    @cart_item = CartItem.new
  end

  private

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end

end
