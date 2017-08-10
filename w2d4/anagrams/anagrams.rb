a = "gizmo"
b = "sally"
c = a.reverse

def anagram?(a, b)
  a.chars.permutation.to_a.map {|el| el.join}.include?(b)
end

def second_anagram?(a,b)

  a_arr = a.chars
  temp_arr = a.chars
  b_arr = b.chars

  # (0...a.length).each do |idx1|
  #   # (0...b.length).each do |idx2|
  #   idx2 = 0
  #   while idx2 < b_arr.length
  #     if a_arr[idx1] == b_arr[idx2]
  #       a_arr.delete_at(idx1)
  #       b_arr.delete_at(idx2)
  #     else
  #       idx2 +=1
  #     end
  #   end
  # end

  temp_arr.each do |el|
    if b_arr.include?(el)
      a_arr.delete(el)
      b_arr.delete(el)
    end
  end
  p a_arr
  p b_arr

  return true if a_arr.empty? && b_arr.empty?
  false
end

def third_anagram?(a,b)
  a.chars.sort == b.chars.sort
end

def fourth_anagram?(a,b)
  hash_a = Hash.new(0)
  hash_b = Hash.new(0)

  a.chars.each { |l| hash_a[l] += 1 }
  b.chars.each { |l| hash_b[l] += 1 }

  hash_a == hash_b
end

def bonus_anagram?(a,b)
  hash_a = Hash.new(0)
  a.chars.each { |l| hash_a[l] += 1 }
  hash_a.each {|k,v| return false unless v == b.count(k)}
  true
end

p second_anagram?(a,b)
