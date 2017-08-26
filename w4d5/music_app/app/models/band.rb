class Band < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :albums,
  primary_key: :id,
  foreign_key: :band_id,
  class_name: :Album,
  dependent: :destroy

  has_one :band,
  through: :albums,
  source: :band

  
end
