require_relative 'board.rb'
require 'singleton'

class Piece
  attr_reader :colour, :icon

  def initialize(colour)
    @colour = colour
    @icon = pick_icon(colour, self.class)
  end

  def pick_icon(colour, piece_class)
    piece_icons =
    {:cyan => {Bishop => '♝ ',
                Rook => '♜ ',
                Knight => '♞ ',
                Queen => '♛ ',
                King => '♚ ',
                Pawn => '♟ '},
    :red =>  {Bishop => '♝ ',
                Rook => '♜ ',
                Knight => '♞ ',
                Queen => '♛ ',
                King => '♚ ',
                Pawn => '♟ '}}

    piece_icons[colour][piece_class]
  end
end

module SlidingPiece

  def moves(start_pos)
    all_possible_moves = []

    self.steps.each do |step|
      new_start_pos = start_pos
      until !new_start_pos[0].between?(0,7) || !new_start_pos[1].between?(0,7)
        new_start_pos = [(new_start_pos[0]+step[0]),(new_start_pos[1]+step[1])]
        all_possible_moves << new_start_pos
      end

    end

    all_possible_moves.reject {|el| el.first < 0 || el.last < 0}
  end

  def move_into_check?(start_pos, end_pos)
    moves(start_pos).include?(end_pos)
  end

end

module SteppingPiece
  def moves

  end

  def move_dirs

  end

end

class NullPiece < Piece
  include Singleton

  def initialize
    @colour = nil
    @icon = '  '
  end

end

class Bishop < Piece
  # include SlidingPiece

  def initialize(colour)
    super
  end

end

class Rook < Piece
  include SlidingPiece

  attr_reader :steps

  def initialize(colour)
    super
    @steps = [[0, 1], [1, 0], [-1, 0], [0, -1]]
  end

end

class Queen < Piece
  # include SlidingPiece

  def initialize(colour)
    super
  end

end

class Knight < Piece
  # include SteppingPiece

  def initialize(colour)
    super
  end

end

class King < Piece
  # include SteppingPiece

  def initialize(colour)
    super
  end

end

class Pawn < Piece

  def initialize(colour)
    super
  end

end
