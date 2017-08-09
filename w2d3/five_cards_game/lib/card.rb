class Card
  attr_reader :value, :suit

  SUITS = [:diamond, :spade, :club, :heart]

  def initialize(value, suit)
    raise ArgumentError, 'Incorrect value' unless (1..13).include?(value)
    raise ArgumentError, 'Not a suit' unless SUITS.include?(suit)
    @value = value
    @suit = suit
  end
end
