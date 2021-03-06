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
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = @next
    @next.prev = @prev
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
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    first == @tail && last == @head
  end

  def get(key)
    current = @head
    until current == @tail
      return current.val if current.key == key
      current = current.next
    end
    nil
  end

  def include?(key)
    get(key).nil? ? false : true
  end

  def append(key, val)
    current = Node.new(key, val)
    current.prev = last
    current.next = @tail
    last.next = current
    @tail.prev = current
  end

  def update(key, val)
    return if empty?
    current = @head
    until current == @tail
      break if current.key == key
      current = current.next
    end
    current.key == key ? current.val = val : return
  end

  def remove(key)
    current = first
    until current == @tail
      break if current.key == key
      current = current.next
    end
    current.remove
  end

  def each
    current = first
    until current == @tail
      yield(current)
      current = current.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
