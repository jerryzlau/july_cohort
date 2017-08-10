require 'rspec'
require 'deck.rb'

describe Deck do
  subject(:deck) { Deck.new }
  describe "#initialize" do
    it "instantiates an array of 52 cards @deck" do
      expect(deck.deck.length).to eq(52)
      expect(deck.deck.all? {|el| el.is_a?(Card)}).to eq(true)
    end

    it "instantiates a shuffled deck" do
      expect(deck.deck.shuffle).to_not eq(deck.deck.sort_by {|card| card.value})
    end

  end

  describe "#deal" do
    it "deals one card" do
      expect(deck.deal).to be_a(Card)
      expect(deck.deck.length).to eq(51)
    end
  end


end
