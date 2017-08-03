def sum_to(n)
  return n if n <= 1
  n + sum_to(n-1)
end

def add_numbers(array)
  return array.first if array.length <= 1
  array.shift + add_numbers(array)
end

def gamma_fnc(num)
  return nil if num == 0
  return 1 if num == 1
  (num - 1) * gamma_fnc(num-1)
end

def ice_cream_shop(flavors, wanted)
  return true if flavors.shift == wanted
  return false if flavors.empty?
  ice_cream_shop(flavors, wanted)
end

def reverse(str)
  return str if str.length == 1
  str[-1] + reverse(str[0..-2])
end
