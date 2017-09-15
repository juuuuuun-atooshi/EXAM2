module PicturesHelper
  def photo_img(picture)
    return image_tag(picture.image, alt: picture.user.name) if picture.image?
    if picture.image?
      image_tag(picture.image, alt: picture.user.name)
    else
      return;
    end
  end
end
