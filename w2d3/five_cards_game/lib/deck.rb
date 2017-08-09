require_relative 'card'

class Deck
  attr_reader :deck

  def initialize
    @deck = populate
  end

  def populate
    populated_deck = []
    (1..13).each do |value|
      Card.valid_suits.each do |suit|
        populated_deck << Card.new(value, suit)
      end
    end
    populated_deck
  end

  def deal
    @deck.shift 
  end

end
