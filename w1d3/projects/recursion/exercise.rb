require 'byebug'

def range(x,y)
  return [] if y < x
  array = []
  array += [x] + range(x+1,y) if x +1 <= y
  array
end

def sum_i(array)
  total = 0
  array.each {|el| total += el }
  total
end

def sum_r(array)
  return 0 if array.empty?
  array.first + sum_r(array[1..-1])
end

def exp_one(b, n)
  return 1 if n == 0
  b * exp_one(b, n-1)
end

def exp_two(b, n)
  return 1 if n == 0
  return b if n == 1
  if n.even?
    exp_one(exp_two(b, n/2), 2)
  else
    b * exp_one(exp_two(b, (n-1)/2), 2)
  end
end

class Array
  def deep_dup
    array = []
    self.each do |el|
      if el.is_a? Array
        array << el.deep_dup
      else
        array << el
      end
    end
    array
  end
end

def fibonacci(num)
  return 1 if num == 1
  return 0 if num <= 0
  fibonacci(num-1) + fibonacci(num-2)
end

def build_array(num)
  array = []
  (0..num).each do |el|
    array << fibonacci(el)
  end
  array
end


def subsets(array)
  return [[]] if array.empty?
  last = array.last
  subs = subsets(array[0...-1])
  subs + subs.map {|s| s + [last]}

end

def permutation(array)



end

def bsearch(array, target)
  return nil if array.empty?

  mid = array.length/2
  if array[mid] == target
    mid
  elsif target > array[mid]
    tracker = bsearch(array[mid+1..-1], target)
    if tracker.nil?
      nil
    else
      (mid + 1) + tracker
    end
  elsif target < array[mid]
    bsearch(array[0...mid], target)
  end

end

def merge_sort(array)
  debugger
  return array if array.length <= 1
  left = []
  right = []

  array.each_with_index do |el,idx|
    if idx < array.length/2
      left << el
    else
      right << el
    end
  end

  left = merge_sort(left)
  right = merge_sort(right)

  merge(left, right)

end

def merge(left, right)
  result = []
  while !left.empty? && !right.empty?
    if left.first <= right.first
      result << left.first
      left = left[1..-1]
    else
      result << right.first
      right = right[1..-1]
    end
  end

  while !left.empty?
    result << left.first
    left = left[1..-1]
  end

  while !right.empty?
    result << right.first
    right = right[1..-1]
  end

  result
end
