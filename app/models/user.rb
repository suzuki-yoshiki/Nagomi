class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :work_reservations, dependent: :destroy
  has_many :phone_reservations, dependent: :destroy
  has_many :work_histories, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :kana,length: { maximum: 50 }
  validates :sex,length: { maximum: 10 }
  validates :email, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :line_id, length: { maximum: 1000 }
  validates :address, length: { maximum: 1000 }
  validates :phone_number, length: { maximum: 1000 }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def self.search(search) #ここでのself.はUser.を意味する
    if search
      where(['name LIKE ?', "%#{search}%"])#検索とnameの部分一致を表示。User.は省略
    else
      all #全て表示。User.は省略
    end
  end
        
end
