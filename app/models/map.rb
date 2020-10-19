class Map < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  validates :address, presence: true
  validates :time, numericality: { only_integer: true }
  validates :near_time, numericality: { only_integer: true }
end
