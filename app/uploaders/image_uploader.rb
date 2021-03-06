class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  version :thumb do
    process resize_to_limit: [800, 800]
  end

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
