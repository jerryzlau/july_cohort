require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if include?(key)
      return
    else
      self[key] << key
      @count += 1
    end

    resize! if @count > num_buckets
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      @count -= 1
      self[key].delete(key)
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    idx = num.hash % num_buckets
    @store[idx-1]
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
