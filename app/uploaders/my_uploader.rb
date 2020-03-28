class MyUploader < ColPictureUploader
  include CarrierWave::MiniMagick
  def store_dir
    nil
  end

  def content_type_whitelist
    /image\//
  end

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  process :resize_to_fit => [600, 400]
end
