module Votable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :votable
  end

  def receive_vote(value)
    Vote.find_or_create_by(value: value)
  end
end
