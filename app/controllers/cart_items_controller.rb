class CartItemsController < ApplicationController
  before_action :setup_cart_item!

 def destroy
  @cart_item = CartItem.find(params[:id])
  @cart_item.destroy

  respond_to do |format|
    format.html { redirect_to cart_url(@cart_item.cart_id), notice: 'メニューをカートから削除しました。' }
    format.json { head :no_content }
  end
 end

 private

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end

end
