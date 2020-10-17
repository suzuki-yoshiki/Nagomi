class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :cart, through: :cart_items
end
