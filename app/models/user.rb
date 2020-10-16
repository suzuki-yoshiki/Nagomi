class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :work_reservations, dependent: :destroy
  has_many :phone_reservations, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :kana,length: { maximum: 50 }
  validates :sex,length: { maximum: 10 }
  validates :email, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :line_id, length: { maximum: 1000 }
  validates :address, length: { maximum: 1000 }
  validates :phone_number, length: { maximum: 1000 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
