class Video < ApplicationRecord
  validates :title, presence: true
  validates :youtube_url, presence: true
end
