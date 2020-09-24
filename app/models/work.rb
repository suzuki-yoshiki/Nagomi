class Work < ApplicationRecord
  validates :content_name, presence: true,length: { minimum: 4 }, length: { maximum: 500 }
  validates :content, length: { maximum: 1000 }
  attachment :profile_image
  mount_uploader :profile_image_id, ImgUploader
end
