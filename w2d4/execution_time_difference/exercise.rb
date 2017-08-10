list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# Phase 1
# def my_min(list)
#
#   list.each do |el1|
#     # bool = false
#     # list.each do |el2|
#     #   bool = true if el1 < el2
#     # end
#     # return smallest = el1 if bool
#     return el1 if list.all? {|el2| el2 >= el1}
#   end
#
# end

# Phase 2
def my_min(list)
  smallest = 0
  list.each do |el|
    smallest = el if el < smallest
  end

  smallest
end

list = [5,3,-7]
list = [-5, -1, -3]
# list = [2, 3, -6, 7, -6, 7]

# Largest contiguous sub-sum
def largest_contiguous_subsum(list)
  array = []
  list.each_with_index do |el1, idx1|
    (idx1+1...list.length).each do |idx2|
      array << list[idx1..idx2].reduce(:+)
    end
  end

  array.max

end

def largest_contiguous_subsum(list)
  # return list.max unless list.any? { |el| el > 0 }
  temp_sum = 0
  max_sum = list.max
  list.each do |el|
    temp_sum += el
    max_sum = temp_sum if temp_sum > max_sum
    temp_sum = 0 if temp_sum < 0
  end
  max_sum
end

p largest_contiguous_subsum(list)
