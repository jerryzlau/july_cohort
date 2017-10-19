class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    total = 0 
    return 0.hash if self.empty?
    self.each_with_index do |el, idx|
      total += (el.to_s + idx.to_s).to_i.hash
    end 
    total
  end
end

class String
  def hash
    total = 0
    self.chars.each_with_index do |el, idx|
      total += (el.ord + idx).hash
    end 
    total
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    (self.keys + self.values).hash
  end
end
