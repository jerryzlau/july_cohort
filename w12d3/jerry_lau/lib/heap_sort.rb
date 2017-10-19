require_relative "heap"

class Array
  def heap_sort!
    prc = Proc.new {|a,b| b <=> a}
    (2..self.length).each do |length|
      BinaryMinHeap.heapify_up(self, length - 1, length, &prc)
    end 
    
    (2..self.length).each do |length|
      self[self.length - length + 1], self[0] = self[0], self[self.length - length + 1]
      BinaryMinHeap.heapify_down(self, 0, self.length - length + 1, &prc)
    end 

    self
  end
end
