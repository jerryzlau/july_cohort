class Tile

  attr_accessor :visible, :bomb

  def initialize(bomb, visible)
    @bomb = bomb
    @visible = visible
  end

  def reveal
    @visible = true
  end


end
