class WorkReservation < ApplicationRecord
  enum  main_menu: { "ー部屋掃除8畳以上" => 0, "ー部屋掃除6畳以下"=> 1, "レンジフードクリーニング"=> 2, "キッチンクリーニング"=> 3, "風呂場"=> 4}

  validates :main_menu, presence: true, allow_blank: true
  validates :option_menu, presence: true, allow_blank: true
  validates :reservation_work, length: { maximum: 1000 }
  # validates :worked_on, presence: true
  # validates :start_times, presence: true
  # validates :price, presence: true

  def start_time  #simple calendarで必要なメソッド
    self.worked_on
  end

  def user
    return User.find_by(id: self.user_id)
  end
end
