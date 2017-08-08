require_relative 'board.rb'
require_relative 'cursor.rb'
require 'colorize'
require 'byebug'
class Display

  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.grid.each.with_index do |row, idx_1|
      row.each.with_index do |el, idx_2|
        print el.icon.colorize(:color => el.colour,
                               :background => tile_colour(idx_1, idx_2))
      end
      puts
    end
  end

  def make_move
    moved = false
    @cursor.selected = false
    @show_selected = false
    start_pos = nil
    until moved
      render
      @cursor.get_input

      if @cursor.selected == true && start_pos.nil?
        start_pos = @cursor.cursor_pos.dup
        @cursor.selected = false
        @show_selected = true
      elsif @cursor.selected == true && start_pos
        end_pos = @cursor.cursor_pos
        @board.move_piece(start_pos, end_pos)
        @cursor.selected = false
        @show_selected = false
        moved = true
      end

      system 'clear'
    end
    render 
  end



  def tile_colour(row, col)
    if @cursor.cursor_pos == [row,col]
      @show_selected ? :yellow : :green
    elsif (row + col).even?
      :white
    else
      :black
    end
  end


end
