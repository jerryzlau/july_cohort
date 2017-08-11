class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max) { false }

  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] ? true : false
  end

  private

  def is_valid?(num)
    raise unless num.is_a? Integer
  end

  def validate!(num)
    #GG??
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    idx = num % num_buckets
    @store[idx-1]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if include?(num)
      return
    else
      self[num] << num
      @count += 1
    end

    if @count > num_buckets
      resize!
    end
  end

  def count
    @store.flatten.length
  end

  def remove(num)
    if include?(num)
      @count -= 1
      self[num].delete(num)
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    idx = num % num_buckets
    @store[idx-1]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = @store.flatten
    @count = 0
    @store = Array.new(num_buckets*2) {Array.new}
    temp.each {|el| self.insert(el)}
  end
end
