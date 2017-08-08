require_relative "board"
class Game

  def initialize

  end

  def play

  end


  def make

  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  d = Display.new(b)
  d.make_move
end
