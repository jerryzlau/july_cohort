class Array
  def my_uniq
    hsh = {}
    self.each { |l| hsh[l] = 0 }
    hsh.keys
  end

  def two_sum
    result = []
    idx_2 = nil
    self.each_with_index do |el, idx_1|
      idx_2 = idx_1 + 1
      while idx_2 < self.length
        result << [idx_1, idx_2] if el + self[idx_2] == 0
        idx_2 += 1
      end
    end
    result
  end

  def my_transpose
    cols = []
    (0...self.length).each do |idx|
      temp = []
      (0...self.length).each do |idx_x|
        temp << self[idx_x][idx]
      end
      cols << temp
    end
    cols
  end

  def stock_picker
    combos = self.combination(2).sort_by { |el| el.last - el.first }.last
    [self.index(combos.first), self.rindex(combos.last)]
  end
end
