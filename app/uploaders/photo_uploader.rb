class PhotoUploader < CarrierWave::Uploader::Base
  # Storage set to "file" column in our photos table
  storage :file

  def store_dir
      'images'
  end

end