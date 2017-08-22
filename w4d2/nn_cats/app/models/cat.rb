class Cat < ApplicationRecord

  validates :color, inclusion: {in: %w(black white orange yellow grey), message: "Invalid Color!"}, presence: true
  validates :sex, inclusion: {in: ["M", "F"], message: "Invalid Sex"}, presence: true
  validates :birth_date, :name, presence: true 


end
