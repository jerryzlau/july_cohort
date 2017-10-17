require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @capacity = 8 
    @store = StaticArray.new(@capacity)
    @length = 0
  end

  # O(1)
  def [](index)
    raise "index out of bounds" if index >= @length
    @store[index]
  end

  # O(1)
  def []=(index, value)
    raise "index out of bounds" if index >= @length
    @store[index] = value 
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0 
    @store[@length - 1] = nil
    @length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length >= @capacity 
    @store[@length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length == 0 
    result = @store[0]
    counter = 0 
    (1..@length-1).each do |idx|
      @store[counter] = @store[idx]
      counter += 1
    end 
    @length -= 1 
    result 
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if @length >= @capacity 
    array = Array.new(@capacity)
    array[0] = val
    (1..@capacity-1).each do |idx|
      array[idx] = @store[idx-1]
    end 
    @length += 1
    @store = array[0..@length]
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    array = Array.new(@length*2)
    (0..@length-1).each do |idx|
      array[idx] = @store[idx]
    end 
    @capacity *= 2
    @store = array 
  end
end

