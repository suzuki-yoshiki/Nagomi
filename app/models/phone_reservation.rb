class PhoneReservation < ApplicationRecord
  has_many :time_reservations, dependent: :destroy
  validates :reservation_work, length: { maximum: 500 }
end
