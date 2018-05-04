require "image_processing/mini_magick"

class ImageUploader < Shrine
  plugin :processing
  plugin :versions, names: [:original, :large, :small, :thumb]  # enable Shrine to handle a hash of files
  plugin :delete_raw # delete processed files after uploading

  process(:store) do |io, context|
    original = io.download
    pipeline = ImageProcessing::MiniMagick.source(original)

    size_1440 = pipeline.resize_to_limit!(1440, 1440)
    size_350 = pipeline.resize_to_limit!(350, 350)
    size_80  = pipeline.resize_to_limit!(80, 80)

    original.close!

    { 
      original: io,
      large: size_1440,
      small: size_350,
      thumb: size_80
    }
  end
end