# encoding: utf-8
require "mini_magick"

class PersonUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :small do
    process :resize_to_fit => [200,nil]
  end

  version :thumb do
     process :resize_to_fit => [100,nil]
  end

  def extension_white_list
     %w(jpg jpeg)
  end

end
