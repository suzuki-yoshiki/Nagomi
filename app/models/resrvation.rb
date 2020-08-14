class Resrvation < ApplicationRecord
  validates :resrvation_work, length: { maximum: 500 }
end
