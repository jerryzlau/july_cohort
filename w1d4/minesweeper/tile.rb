class Tile

  attr_accessor :visible, :bomb, :bomb_idx

  def initialize(bomb, visible, bomb_idx)
    @bomb = bomb
    @visible = visible
    @bomb_idx = bomb_idx
  end

  def reveal
    @visible = true
  end


end
