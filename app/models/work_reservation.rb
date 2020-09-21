class WorkReservation < ApplicationRecord
  belongs_to :user
  validates :reservation_work, length: { maximum: 500 }

  def start_time  #simple calendarで必要なメソッド
    self.worked_on
  end
end
