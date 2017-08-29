class Sub < ApplicationRecord

  validates :title, :description, presence: true
  # validates :title, unique: true

  belongs_to :moderator,
  primary_key: :id,
  foreign_key: :moderator_id,
  class_name: :User

  has_many :postsubs,
  primary_key: :id,
  foreign_key: :sub_id,
  class_name: :Postsub,
  dependent: :destroy,
  inverse_of: :sub
  
  has_many :posts,
  through: :postsubs,
  source: :post

end
