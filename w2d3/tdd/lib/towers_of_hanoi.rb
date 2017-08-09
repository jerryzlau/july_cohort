class TowersOfHanoi
  attr_reader :board

  def initialize
    @board = [[1,2,3], [], []]
  end

  def move(start_pos, end_pos)
    start_tile = @board[start_pos].first
    end_top_tile = @board[end_pos].first
    raise if start_tile > end_top_tile unless end_top_tile.nil?
    @board[end_pos].unshift(@board[start_pos].shift)
  end

  def won?
    first_check = @board.first.empty?
    second_check = @board[1] == [1,2,3] || @board[2] == [1,2,3]
    first_check && second_check
  end

end
