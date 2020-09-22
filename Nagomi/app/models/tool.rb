class Tool < ApplicationRecord
  validates :tool_name, presence: true, length: { maximum: 30 }
  validates :price, presence: true
  validates :tool_count, presence: true
  attachment :image
end
