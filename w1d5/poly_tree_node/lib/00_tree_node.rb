class PolyTreeNode
  attr_reader :value
  attr_accessor :parent, :children

  def initialize(value, children = [], parent = nil)
    @value = value
    @children = children
    @parent = parent
  end

  def parent=(new_parent)
    return if new_parent == @parent
    @parent.children.delete(self) unless @parent.nil?
    @parent = new_parent
    new_parent.children << self unless @parent.nil?
  end


end
