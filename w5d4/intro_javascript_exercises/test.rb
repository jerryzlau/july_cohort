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
