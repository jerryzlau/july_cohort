def twoSum(array)
  indices = []
  (0...array.length).each do |idx|
    (idx+1...array.length).each do |idxx|
      indices << [idx,idxx] if array[idx] + array[idxx] == 0
    end
  end
  indices
end

def transpose(array)
  result = Array.new(array[0].length) { Array.new(array.length) }
  (0..array.length-1).each do |i|
    (0..array[0].length-1).each do |j|
      result[j][i] = array[i][j]
    end
  end
  result
end

def bubbleSort(array)
  array.length.times do
    (0...array.length).each do |idx|
      if idx+1 < array.length && array[idx] > array[idx+1]
        array[idx], array[idx+1] = array[idx+1], array[idx]
      end
    end
  end

  array
end

def range(start, end_range)
  return [start] if start == end_range
  [start] + range(start + 1, end_range)
end

def fib(n)
  return [0] if n == 1
  return [0,1] if n == 2

  result = fib(n-1)
  next_fib = result.last + result[result.length - 2]
  result << next_fib
end

def bsearch(array, target)
  if array.length == 1
    array.first == target ? array.first : nil
  end

  mid = array.length/2
  left = array.take(mid)
  right = array.drop(mid)

  if array[mid] == target
    return mid
  elsif target > array[mid]
    return bsearch(right, target) + mid
  elsif target < array[mid]
    bsearch(left, target)
  end

end
