require 'byebug'
class Array
  def my_each(&block)
    i = 0
    while i < self.length
      block.call(self[i])
      i += 1
    end
    self
  end

  def my_select
    selected = []
    self.my_each do |el|
      if yield(el)
        selected << el
      end
    end
    selected
  end

  def my_reject
    rejected = []
    self.my_each do |el|
      rejected << el if !yield(el)
    end
    rejected
  end

  def my_any?
    self.my_each do |el|
      return true if yield(el)
    end
    false
  end

  def my_all?
    self.my_each do |el|
      return false if !yield(el)
    end
    true
  end

  def my_flatten
    array = []
    self.my_each do |el|
      if el.class == Array
        array += el.my_flatten
      else
        array << el
      end
    end
    array
  end

  def my_zip(*args)
    array = []
    (0...self.length).to_a.my_each do |idx|
      temp = [self[idx]]
      args.my_each do |el|
        temp << el[idx]
      end
      array << temp
    end
    array

  end

  def my_rotate(n = 1)
    if n < 0
      n.abs.times do
        self.unshift(self.pop)
      end
    else
      n.times do
        self.push(self.shift)
      end
    end
    self
  end

  def my_join(symbol = "")
    string = ""
    self.each do |el|
      string += el + symbol
    end

    if symbol == ""
      return string
    else
      return string[0..-2]
    end
  end

  def my_reverse
    array = []
    self.length.times do
      array << self.pop
    end
    array
  end
end

# ### Factors
#
# Write a method `factors(num)` that returns an array containing all the
# factors of a given number.

def factors(num)
  (1..num).select {|el| num%el == 0 }
end

# ### Bubble Sort
#
# http://en.wikipedia.org/wiki/bubble_sort
#
# Implement Bubble sort in a method, `Array#bubble_sort!`. Your method should
# modify the array so that it is in sorted order.
#
# > Bubble sort, sometimes incorrectly referred to as sinking sort, is a
# > simple sorting algorithm that works by repeatedly stepping through
# > the list to be sorted, comparing each pair of adjacent items and
# > swapping them if they are in the wrong order. The pass through the
# > list is repeated until no swaps are needed, which indicates that the
# > list is sorted. The algorithm gets its name from the way smaller
# > elements "bubble" to the top of the list. Because it only uses
# > comparisons to operate on elements, it is a comparison
# > sort. Although the algorithm is simple, most other algorithms are
# > more efficient for sorting large lists.
#
# Hint: Ruby has parallel assignment for easily swapping values:
# http://rubyquicktips.com/post/384502538/easily-swap-two-variables-values
#
# After writing `bubble_sort!`, write a `bubble_sort` that does the same
# but doesn't modify the original. Do this in two lines using `dup`.
#
# Finally, modify your `Array#bubble_sort!` method so that, instead of
# using `>` and `<` to compare elements, it takes a block to perform the
# comparison:
#
# ```ruby
# [1, 3, 5].bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending
# [1, 3, 5].bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending
# ```
#
# #### `#<=>` (the **spaceship** method) compares objects. `x.<=>(y)` returns
# `-1` if `x` is less than `y`. If `x` and `y` are equal, it returns `0`. If
# greater, `1`. For future reference, you can define `<=>` on your own classes.
#
# http://stackoverflow.com/questions/827649/what-is-the-ruby-spaceship-operator

class Array
  def bubble_sort!

    (0..self.length-1).each do |idx|
      (idx+1..self.length-1).each do |idxx|
        if block_given?
          if yield(self[idx],self[idxx]) == 1
            self[idx], self[idxx] = self[idxx], self[idx]
          end
        else
          if self[idx] > self[idxx]
            self[idx], self[idxx] = self[idxx], self[idx]
          end
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort! if !block_given?
    self.dup.bubble_sort!(&prc)
  end

  #testing push command
end



# ### Substrings and Subwords
#
# Write a method, `substrings`, that will take a `String` and return an
# array containing each of its substrings. Don't repeat substrings.
# Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
# "t"]`.
#
# Your `substrings` method returns many strings that are not true English
# words. Let's write a new method, `subwords`, which will call
# `substrings`, filtering it to return only valid words. To do this,
# `subwords` will accept both a string and a dictionary (an array of
# words).

def substrings(string)
  array = []
  (0..string.length-1).each do |idx|
    (idx..string.length-1).each do |idx2|
      array << string[idx..idx2]
    end
  end
  array
end


def subwords(word, dictionary)
  substrings(word).select {|el| dictionary.include?(el)}.uniq
end
