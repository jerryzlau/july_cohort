require_relative 'bst_node.rb'
# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    new_node = BSTNode.new(value)
    current_node = @root  
    inserted = false 
    if @root 
      until inserted
        if value > current_node.value 
          if current_node.right 
            current_node = current_node.right 
          else 
            current_node.right = new_node 
            new_node.parent = current_node
            inserted = true 
          end 
        elsif value < current_node.value 
          if current_node.left 
            current_node = current_node.left 
          else 
            current_node.left = new_node 
            new_node.parent = current_node
            inserted = true 
          end 
        end 
      end 
    else 
      @root = new_node 
      @root.parent = nil 
    end 
  end

  def find(value, tree_node = @root)
    if tree_node.nil? 
      return nil 
    elsif tree_node.value == value 
      return tree_node
    else 
      if tree_node.value < value 
        find(value, tree_node.right)
      elsif tree_node.value > value 
        find(value, tree_node.left)
      end 
    end 
  end

  def delete(value)
    target_node = find(value, @root)
    max_node = maximum(@root)
    if target_node == @root
      target_node = nil 
      @root = nil 
    end 

    if target_node
      # no children delete current node 
      if target_node.right.nil? && target_node.left.nil? 
        if target_node.parent.right == target_node
          target_node.parent.right = nil 
        else 
          target_node.parent.left = nil 
        end 
        target_node = nil 
      # has one child promote it 
      elsif (target_node.right.nil? && !target_node.left.nil?)
        parent = target_node.parent 
        child = target_node.right
        if parent.value > child.value 
          parent.left = child 
        else 
          parent.right = child 
        end 
        target_node = nil 
      # otherwise it has two children 
      # else
      #   max_node_parent = max_node.parent 

      #   left_child = @root.left 
      #   right_child = @root.right 
      #   @root = max_node 
      #   @root.left = left_child 
      #   @root.right = right_child 
      end 
    end 

  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    if tree_node.right.nil? 
      return tree_node
    else 
      maximum(tree_node.right)
    end 
  end

  def depth(tree_node = @root)
    if tree_node.nil?
      return -1
    else 
      left_depth = depth(tree_node.left)
      right_depth = depth(tree_node.right)

      if left_depth > right_depth
        return left_depth + 1
      else 
        return right_depth + 1
      end 
    end 
  end 

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil?

    balanced = true 
    left_depth = depth(tree_node.left)
    right_depth = depth(tree_node.right)
    balanced = false if (left_depth - right_depth).abs > 1

    if balanced && is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
      return true 
    end 

    false 
  end

  def in_order_traversal(tree_node = @root, arr = [])
    if tree_node.left 
      in_order_traversal(tree_node.left, arr)
    end 

    arr.push(tree_node.value)

    if tree_node.right
      in_order_traversal(tree_node.right, arr)
    end 

    arr
  end


  private
  # optional helper methods go here:

end
