class Poll < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :author_id, presence: true

  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  has_many :questions,
    foreign_key: :question_id,
    class_name: :Question
end
