class Review < ApplicationRecord
  validates :content, presence: true, length: { maximum: 150 }
  attachment :image
end
