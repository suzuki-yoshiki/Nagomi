class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :name, presence: true, length: { maximum: 50 }
  validates :kana, length: { maximum: 50 }
  validates :sex, length: { maximum: 10 }
  validates :email, presence: true, length: { maximum: 100 }
  validates :line_id, length: { maximum: 1000 }
  validates :address, length: { maximum: 1000 }
  validates :phone_number, length: { maximum: 1000 }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
