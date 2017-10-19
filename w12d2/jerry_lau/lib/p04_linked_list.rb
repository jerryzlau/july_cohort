class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    self.prev.next = self.next if self.prev
    self.next.prev = self.prev if self.next
    self.next = nil
    self.prev = nil
    self
  end
end

class LinkedList
  include Enumerable
  
  def initialize
    @head = Node.new 
    @tail = Node.new 
    @head.next = @tail 
    @tail.prev = @head 
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next 
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    current = @head
    until current == @tail 
      if current.key == key 
        return current.val
      else 
        current = current.next 
      end 
    end 
    nil 
  end

  def include?(key)
    current = @head.next 
    until current == @tail 
      if current.key == key 
        return true 
      else 
        current = current.next 
      end 
    end 
    false 
  end

  def append(key, val)
    node = Node.new(key, val) 
    @tail.prev.next = node 
    node.prev = @tail.prev 
    @tail.prev = node 
    node.next = @tail
  end

  def update(key, val)
    current = @head.next 
    until current == @tail 
      if current.key == key 
        return current.val = val 
      else 
        current = current.next 
      end 
    end 
  end

  def remove(key)
    current = @head.next 
    until current == @tail 
      if current.key == key 
        current.remove 
        return 
      else 
        current = current.next 
      end 
    end 
  end

  def each
    current = @head.next
    until current == @tail
      yield current
      current = current.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
