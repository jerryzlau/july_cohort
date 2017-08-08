require_relative 'piece.rb'
require 'colorize'
require_relative 'display.rb'
class Board

  attr_reader :grid

  def initialize
    @grid = initialize_grid
  end

  def initialize_grid(type = :standard)
    null_piece = NullPiece.instance
    if type == :standard
      grid = Array.new(8) {Array.new(8) {null_piece}}
      #back line
      grid[0] = back_line(:red)
      grid[7] = back_line(:cyan)
      #front line
      grid[1] = Array.new(8) {Pawn.new(:red)}
      grid[6] = Array.new(8) {Pawn.new(:cyan)}
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
    row.reverse! if colour == :red
    row
  end

  def [](pos)
    x = pos[0]
    y = pos[1]
    @grid[x][y]
  end

  def move_piece(start_pos, end_pos)
    #error messages
    if start_pos == end_pos
      raise "start position and end position are the same"
    elsif self[start_pos].is_a?(NullPiece)
      raise "no piece at start position"
    elsif self[end_pos].colour == self[start_pos].colour
      raise "can't step on your own piece'"
    end

    #make moves 
    start_piece = self[start_pos]
    self[start_pos] = self[end_pos]
    self[end_pos] = start_piece
  end

  def []=(pos, target)
    x = pos[0]
    y = pos[1]
    @grid[x][y] = target
  end

end
