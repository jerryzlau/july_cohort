def expo(b, n)

end



def subsets(array)
  return [] if array.empty?
  [array.shift] << subsets(array)
end


p subsets([1, 2])
