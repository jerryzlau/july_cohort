class Post < ApplicationRecord
  include Votable
  
  validates :title, :subs, :user, presence: true

  belongs_to :user,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :User

  has_many :postsubs,
  primary_key: :id,
  foreign_key: :post_id,
  class_name: :Postsub,
  dependent: :destroy,
  inverse_of: :post

  has_many :subs,
  through: :postsubs,
  source: :sub

  has_many :comments


end
