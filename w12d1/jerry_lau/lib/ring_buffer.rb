require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @capacity = 8 
    @store = StaticArray.new(@capacity)
    @length = 0
    @start_idx = 0 
  end

  # O(1)
  def [](index)
    raise "index out of bounds" if index >= @length
    @store[index]
  end

  # O(1)
  def []=(index, val)
    raise "index out of bounds" if index >= @length
    @store[index] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0 
    @store[@length-1] = nil
    @length -= 1
  end

  # O(1) ammortized
  def push(val)
    resize! if @length >= @capacity 
    @store[@length] = val
    @length += 1
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length == 0 
    result = @store[@start_idx]
    @start_idx = (@start_idx + 1) % @capacity
    @length -= 1 
    result 
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @length >= @capacity 
    @store[(@start_idx -1)% @capacity] = val
    @start_idx = (@start_idx - 1) % @capacity 
    @length += 1
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!
    array = Array.new(@length*2)
    (0..@length-1).each do |idx|
      array[idx] = @store[idx]
    end 
    @capacity *= 2
    @store = array 
  end
end
