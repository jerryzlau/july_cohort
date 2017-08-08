require_relative "board.rb"
require_relative "display.rb"

class Game

  def initialize
    b = Board.new
    @d = Display.new(b)
  end

  def play
    stopper = false
    until stopper
      begin
        @d.make_move
      rescue
        puts "invalid move"
        retry
      end
    end

  end





end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
