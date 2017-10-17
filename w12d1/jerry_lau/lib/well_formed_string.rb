# def well_formed?(str)
#   opens = ["{", "[", "("]
#   closes = ["}", "]", ")"]
#   open_stack = [] 
#   close_stack = [] 

#   str.each_char do |char|
#     if opens.include?(char)
#       open_stack.push(char)
#     elsif closes.include?(char)
#       close_stack.push(char)
#     end 
#   end 

#   return false if open_stack.length != close_stack.length 
#   open_stack.length.times do 
#     opened = open_stack.pop
#     closed = close_stack.pop 
#     if opens.index(opened) != closes.index(closed)
#       return false 
#     end 
#   end 

#   true 

# end

def well_formed?(str)
  left_chars = []
  lookup = { '(' => ')', 
             '[' => ']',
             '{' => '}'}
  
  str.chars.each do |char|
    if lookup.keys.include?(char)
      left_chars << char 
    elsif left_chars.length == 0 || lookup[left_chars.pop] != char 
      return false 
    end 
  end 

  return left_chars.empty? 
end 


p well_formed?("[({([])})]")
