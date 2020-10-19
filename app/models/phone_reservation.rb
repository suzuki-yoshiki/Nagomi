class PhoneReservation < ApplicationRecord
  belongs_to :user
  validates :reservation_work, length: { maximum: 500 }
  enum  line_time: { "11:00": 0, "12:00": 1, "13:00": 2, "14:00": 3, "15:00": 4, "16:00": 5, "17:00": 6,}
end
