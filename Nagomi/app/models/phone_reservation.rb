class PhoneReservation < ApplicationRecord
  validates :reservation_work, length: { maximum: 500 }
end
