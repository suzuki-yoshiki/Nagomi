class CartItem < ApplicationRecord
  belongs_to :work
  belongs_to :cart
end
