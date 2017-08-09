class Card
  attr_reader :value, :suit


  def initialize(value, suit)
    raise ArgumentError, 'Incorrect value' unless (1..13).include?(value)
    raise ArgumentError, 'Not a suit' unless Card.valid_suits.include?(suit)
    @value = value
    @suit = suit
  end

  def self.valid_suits
    %i(diamond spade club heart)
  end
end
