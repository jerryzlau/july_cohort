class Piece
  attr_reader  :colour

  def initialize(colour)
    @colour = colour
    @icon = pick_icon(colour, self.class)
  end

  def pick_icon(colour, piece_class)
    piece_icons =
    {:white => {Bishop => '♗',
                Rook => '♖',
                Knight => '♘',
                Queen => '♕',
                King => '♔',
                Pawn => '♙'},
    :black =>  {Bishop => '♝',
                Rook => '♜',
                Knight => '♞',
                Queen => '♛',
                King => '♚',
                Pawn => '♟'}}

    piece_icons[colour][piece_class]
  end
end

class NullPiece < Piece

  def initialize
    @colour = nil
    @icon = ' '
  end

end

class Bishop < Piece

  def initialize(colour)
    super
  end

end

class Rook < Piece

  def initialize(colour)
    super
  end

end

class Queen < Piece

  def initialize(colour)
    super
  end

end

class Knight < Piece

  def initialize(colour)
    super
  end

end

class King < Piece

  def initialize(colour)
    super
  end

end

class Pawn < Piece

  def initialize(colour)
    super
  end

end
