require 'rspec'
require 'hand'

describe Hand do
  subject(:hand) { Hand.new }
  describe "#initialize" do
    it "instantiates @hand variable with empty array"
  end

  describe "#combos" do
    it "accepts 2 or 3 or 4"

    it "creates all combinations of given size"
  end

  describe "#add_card" do
    it "raises error if new total > 5"
    it "adds 1-3 cards to the hand"
  end

  describe "#discard_cards" do
    it "raises error if try to discard > 3"
    it "takes variable number of cards (3 max) to discard"
  end

  describe "#royal_flush?" do
    it "returns true for a royal_flush"
  end

  describe "#straight_flush?" do
    it "returns true for a straight flush"
  end

  describe "#four_repeat?" do
    it "returns true for four of a kind"
  end

  describe "#full_house?" do
    it "returns true for a full house"
  end

  describe "#flush?" do
    it "return true for a flush"
  end

  describe "#straight?" do
    it "return true if straight"
  end

  describe "#three_repeat?" do
    it "returns true for three of a kind"
  end

  describe "#two_pair?" do
    it "returns true for two pairs"
  end

  describe "#pair?" do
    it "returns true for pairs"
  end

  

end
