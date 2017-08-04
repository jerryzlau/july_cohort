require_relative 'tile'

class Board

  attr_accessor :grid

  def initialize(board_size = 9)
    @grid = Array.new(board_size) {Array.new(board_size) {Tile.new(false,false)}}
    place_bombs
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def generate_bombs(num_bomb = 15)
    bombs = []
    until bombs.length == num_bomb
      pos = [rand(@grid.size-1), rand(@grid.size-1)]
      bombs << pos unless bombs.include?(pos)
    end
    bombs
  end


  def render
    print " "
    (0..8).to_a.each {|el| print el.to_s + " "}
    @grid.each_index do |idx|
      puts
      print "#{idx}"
      @grid[idx].each do |el|
        print "# " if el.visible
        print "  " unless el.visible
      end
    end
    puts
  end

  def render_loss
    print " "
    (0..8).to_a.each {|el| print el.to_s + " "}
    @grid.each_index do |idx|
      puts
      print "#{idx}"
      @grid[idx].each do |el|
        print "* " if el.bomb
        print "# " if el.visible
        print "  " unless el.bomb
      end
    end
    puts
  end

  def place_bombs
    bombs = generate_bombs
    bombs.each do |pos|
      self[pos].bomb = true
    end
  end
end
