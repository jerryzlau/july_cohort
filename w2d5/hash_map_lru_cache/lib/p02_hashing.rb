class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    if self == self.sort
      result = 0
      self.each {|el| result += el.hash}
    else
      result = self.pop.hash
      self.each {|el| result -= el.hash}
    end
    result
  end
end

class String
  def hash
    strhash = self.chars
    if strhash == strhash.sort
      result = 0
      strhash.map {|s| s.ord }.each do |el|
        result += el.hash
      end
    else
      result = strhash.pop.hash
      strhash.map {|s| s.ord }.each do |el|
        result -= el.hash
      end
    end
    result
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_array = self.to_a.flatten
    result = 0
    hash_array.each {|el| result += el.hash}
    result
  end
end
