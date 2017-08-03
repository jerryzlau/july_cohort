def quicksort(arr)
  return arr if arr.length <= 1
  pivot = arr.first
  left = arr[1..-1].select {|el| el < arr.first}
  right = arr[1..-1].select {|el| el >= arr.first}
  quicksort(left) + pivot + quicksort(right)
end

def factorial(n)
  return n if n <= 2
  n * factorial(n-1)
end

def upcase(str)
  return str if str.length <= 0
  str[0].upcase + upcase(str[1..-1])
end

def reverse(str)
  return str if str.length <= 1
  str[-1] + reverse(str[0..-2])
end
