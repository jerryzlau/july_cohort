require 'towers_of_hanoi'
require 'rspec'

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }
  describe "#initialize" do
    it "initialize starting board array" do
      expect(game.board).to eq([[1,2,3], [], []])
    end

  end

  describe "#move" do
    it "takes starting and ending as arguments" do
      expect(game).to receive(:move).with(0, Integer)
      game.move(0,1)
    end

    it "moves the disc from start to end" do
      game.move(0,2)
      expect(game.board).to eq([[2,3],[],[1]])
    end

    it "only makes a valid move" do
      game.move(0,2)
      expect{ game.move(0,2)}.to raise_error
    end

  end

  describe "#won?" do
    it "returns correct win condition boolean" do
      game.board.reverse!
      expect(game.won?).to eq(true)
    end
  end

end
