class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |photo|
      photo.string :title
      photo.string :photo_desc
      photo.string :file
      photo.belongs_to :album
      photo.timestamps
    end
  end
end
