require_relative 'stacks_queues'
array = [1, 0, 2, 5, 4, 8]

def naive_solution(array, window)
  current_max_range = nil
  array.each_with_index do |el, idx|
    temp = array[idx...idx+window]
    temp_max_range = temp.max - temp.min
    if current_max_range.nil? || temp_max_range > current_max_range
      current_max_range = temp_max_range
    end
  end
  current_max_range
end

def optimized_solution(array, window)
  current_max_range = nil
  array.each_with_index do |el, idx|
    sq = StackQueue.new
    (idx...idx+window).each {|idxx| sq.enqueue(array[idxx]) }
    temp_max_range = sq.max - sq.min
    if current_max_range.nil? || temp_max_range > current_max_range
      current_max_range = temp_max_range
    end
  end

  current_max_range

end

p optimized_solution([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p optimized_solution([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p optimized_solution([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p optimized_solution([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
