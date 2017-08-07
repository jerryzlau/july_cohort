require_relative 'piece.rb'
class Board

  attr_reader :grid

  def initialize
    @grid = initialize_grid
  end

  def initialize_grid(type = :standard)
    null_piece = NullPiece.new
    if type == :standard
      grid = Array.new(8) {Array.new(8) {null_piece}}
      #back line
      grid[0] = back_line(:black)
      grid[7] = back_line(:white)
      #front line
      grid[1] = Array.new(8) {Pawn.new(:black)}
      grid[6] = Array.new(8) {Pawn.new(:white)}
    end
    grid
  end

  def back_line(colour)
    row = [Rook.new(colour),
           Knight.new(colour),
           Bishop.new(colour),
           Queen.new(colour),
           King.new(colour),
           Bishop.new(colour),
           Knight.new(colour),
           Rook.new(colour)]
    row.reverse! if colour == :black
    row
  end




end
