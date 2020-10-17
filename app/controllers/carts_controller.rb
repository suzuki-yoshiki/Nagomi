class CartsController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

  def show
    @cart_items = current_cart.cart_items
    @item = Item.find(params[:id])
  end

  # 商品一覧画面から、「お見積りカートに入れる」を押した時のアクション
  def add_item
    if @cart_item.blank?
      @cart_item = current_cart.cart_items.build(item_id: params[:item_id])
      @cart_item.quantity = 0
    end
      @cart_item.quantity += 1
      @cart_item.save
      redirect_to current_cart
  end

  # カート詳細画面から、「更新」を押した時のアクション
  def update_item
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  # カート詳細画面から、「削除」を押した時のアクション
  def delete_item
    @cart.destroy
    redirect_to current_cart
  end

  private

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end

end
