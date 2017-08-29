class Post < ApplicationRecord

  validates :title, :sub, presence: true

  belongs_to :sub,
  primary_key: :id
  foreign_key: :sub_id,
  class_name: :Sub

  belongs_to :user,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :User
end
