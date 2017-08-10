a = "gizmo"
b = "sally"
c = a.reverse

def anagram(a, b)
  a.chars.permutation.to_a.map {|el| el.join}.include?(b)
end

def second_anagram(a,b)


  (0...a.length).each do |idx1|
    (0...b.length).each do |idx2|
      if a[idx1] == b[idx2]
        a.delete(idx1)
        b.delete(idx2)
      end
    end
  end
  return
end

p anagram(a,b)
