class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :item, through: :cart_items

  def total_price
		cart_items.to_a.sum { |item| item.total_price }
	end

end