class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |album|
      album.string :name
      album.string :album_desc
      album.belongs_to :user
      album.timestamps
    end
  end
end
