arr = [0, 1, 5, 5, 7]
def bad_two_sum?(arr, target)
  #O(n^2) because worst scenario will have to go through the array twice
  temp = []
  arr.each_with_index do |el, idx|
    (idx+1..arr.length-1).each do |idx2|
      return true if el + arr[idx2] == target
    end
  end
  false
end

def okay_two_sum?(arr,target)
  temp_arr = arr.dup.sort
  temp_arr.each_with_index do |el,idx|
    index_of_bsearch = bsearch(arr, target)
    unless index_of_bsearch.nil?
      return true if index_of_bsearch != idx
    end
  end
  false
end

def bsearch(arr, target)
  return nil if arr.empty?
  sorted_arr = arr.dup

  mid_idx = sorted_arr.length/2
  left = sorted_arr.take(mid_idx)
  right = sorted_arr.drop(mid_idx+1)

  if sorted_arr[mid_idx] == target
    return mid_idx
  elsif sorted_arr[mid_idx] < target
    right_idx = bsearch(right, target)
    if right_idx.nil?
      return nil
    else
      right_idx + mid_idx + 1
    end
  else
    bsearch(left, target)
  end
end

def hash_two_sum?(arr, target)
  hash = {}
  arr.each_with_index {|el, idx| hash[idx] = el}
  hash.keys.each do |k|
    if hash.value?(target-hash[k]) && hash.key(target - hash[k]) != k
      return true
    end
  end
  false
end


p hash_two_sum?(arr,10)
