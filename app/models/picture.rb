class Picture < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true, length: { in: 1..140 }
  validates :image, presence: true

  belongs_to :user
  mount_uploader :image, ImageUploader

  def self.pictures_delete(user_id)
    pictures = Picture.where(user_id: user_id)
    unless pictures.blank?
      pictures.delete_all
    end
  end

end
