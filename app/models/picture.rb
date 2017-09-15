class Picture < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true, length: { in: 1..140 }
  validates :image, presence: true

  belongs_to :user
  mount_uploader :image, ImageUploader

end
