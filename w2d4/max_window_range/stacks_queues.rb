class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.count
  end

  def empty?
    @store.length == 0
  end
end

class MyStack
  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def pop
    @store.pop
  end

  def push(el)
    return if el == nil 
    @store << el
    @max = el if @max.nil? || el > @max
    @min = el if @min.nil? || el < @min
  end

  def peek
    @store.last
  end

  def size
    @store.count
  end

  def empty?
    @store.length == 0
  end

  def max
    @max
  end

  def min
    @min
  end
end

class StackQueue
  def initialize
    @master = MyStack.new
  end

  def enqueue(el)
    @master.push(el)
  end

  def dequeue
    temp = MyStack.new

    until @master.empty?
      temp.push(@master.pop)
    end

    dequeue_return = temp.pop

    until temp.empty?
      @master.push(temp.pop)
    end

    dequeue_return
  end

  def size
    @master.size
  end

  def empty?
    @master.empty?
  end

  def max
    @master.max
  end

  def min
    @master.min
  end
end
