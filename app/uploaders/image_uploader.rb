require "image_processing/mini_magick"

class ImageUploader < Shrine
  plugin :processing
  plugin :versions, names: [:original, :large, :small, :thumb]  # enable Shrine to handle a hash of files
  plugin :delete_raw # delete processed files after uploading
  plugin :validation_helpers

  Attacher.validate do
    validate_max_size 10.megabytes, message: 'is too large (max 10mb)'
    validate_mime_type_inclusion ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
  end

  process(:store) do |io, context|
    original = io.download
    pipeline = ImageProcessing::MiniMagick.source(original)

    size_1440 = pipeline.resize_to_limit!(1440, 1440)
    size_600 = pipeline.resize_to_limit!(600, 600)
    size_350 = pipeline.resize_to_limit!(350, 350)
    size_80  = pipeline.resize_to_limit!(80, 80)

    original.close!

    { 
      original: io,
      large: size_1440,
      medium: size_600,
      small: size_350,
      thumb: size_80
    }
  end
end