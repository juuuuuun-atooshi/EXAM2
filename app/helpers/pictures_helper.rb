module PicturesHelper
  def photo_img(picture)
    if picture.image?

      image = MiniMagick::Image.open(picture.image.file.file)

      wdth = image[:width]
      hght = image[:height]

      if wdth > 1000 && hght > 500
        image.resize "600x400"
        image.write picture.image.file.file
      end

      image_tag(picture.image, alt: picture.user.name)
    else
      return;
    end
  end
end
