class Track < ApplicationRecord

  validates :title, :ord, :lyrics, presence: true
  validates :bonus, inclusion: { in: [true, false] }

  belongs_to :album,
  primary_key: :id,
  foreign_key: :album_id,
  class_name: :Album
end
