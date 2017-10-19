require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count == num_buckets
      @store[0] << key
      @count = 0 
      resize!
    else 
      @store[key] << key
      @count += 1 
    end 
  end

  def include?(key)
    @store[key].include?(key)
  end

  def remove(key)
    @store[key].delete(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    resized = Array.new(num_buckets*2) { Array.new }
    @store.each do |el|
      el.each do |e|
        resized[e.hash % (num_buckets*2)] << e 
      end 
    end 
    @store = resized
  end
end
