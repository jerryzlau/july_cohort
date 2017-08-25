class Track < ApplicationRecord

  validates :tracks, :album_id, presence: true
  validates :tracks, :title, presence: true, unique: true
  

  belongs_to :album,
  primary_key: :id,
  foreign_key: :album_id,
  class_name: :Album
end
