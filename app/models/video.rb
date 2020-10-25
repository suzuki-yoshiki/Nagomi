class Video < ApplicationRecord
  validates :title, presence: true
  validates :youtube_url, presence: true,
                  format: { with: /\A(https\:\/\/)?(www\.)?(youtube\.com\/watch\?v=|youtu\.be\/)+[\S]{11}\z/ }
end

