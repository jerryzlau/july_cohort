require 'rspec'
require 'card.rb'

describe Card do
  subject(:card) { Card.new(7, :diamond) }
  describe "#initialize" do
    it "instantiates value within correct range" do
      expect(card.value).to eq(7)
    end

    it "raises error if incorrect value" do
      expect { Card.new(100, :diamond) }.to raise_error('Incorrect value')
    end

    it "instantiates suit" do
      expect(card.suit).to eq(:diamond)
    end

    it "raise error if incorrect suit" do
      expect { Card.new(7, :bunny) }.to raise_error('Not a suit')
    end

  end
end
