require 'byebug'
class Array
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
  end

  def my_select
    selected = []
    self.my_each {|el| selected << el if yield(el)}
    selected
  end

  def my_reject
    rejects = []
    self.my_each { |el| rejects << el if !yield(el)}
    rejects
  end

  def my_any?
    self.my_each {|el| return true if yield(el)}
    false
  end

  def my_all?
    self.my_each {|el| return false if !yield(el)}
    true
  end

  def my_flatten(flattened = [])
    self.my_each do |el|
      el.class == Array ? el.my_flatten(flattened) : flattened << el
    end
    flattened
  end

  def my_zip(*args)
    zip = []
    self.each_with_index do |el, idx|
      temp = [el]
      args.my_each {|n| temp << n[idx]}
      zip << temp
    end
    zip
  end

  def my_rotate(n = 1)
    if n >= 0
      n.times {self << self.shift}
    else
      n.abs.times {self.unshift(self.pop)}
    end
    self
  end

  def my_join(symbol = nil)
    joined = ""
    self.my_each {|el| joined << el.to_s + symbol.to_s}
    symbol.nil? ? joined : joined[0..-2]
  end

  def my_reverse(reversed = [])
    return reversed if self.empty?
    reversed << self.pop
    self.my_reverse(reversed)
  end
end
