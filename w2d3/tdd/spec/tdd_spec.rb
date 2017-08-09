require 'rspec'
require 'tdd'

describe Array do
  describe "#my_uniq" do
    subject(:uniq_array) { [1,1,2,2,3,3] }
    it "returns unique elements in array" do
      new_arr = [1,2,3]
      expect(uniq_array.my_uniq).to eq(new_arr)
    end

    it "doen't use built in uniq" do
      expect(uniq_array).not_to receive(:uniq)
      uniq_array.my_uniq
    end
  end

  describe "#two_sum" do
    subject(:sum_array) {[-1 ,0 ,2 ,-2 ,1]}
    it "return array of index pairs that sum to zero" do
      expect(sum_array.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    subject(:row) { [
                    [0, 1, 2],
                    [3, 4, 5],
                    [6, 7, 8]
                  ]}

    it "returns transposition of 2d array" do
      expect(row.my_transpose).to eq([
                                      [0, 3, 6],
                                      [1, 4, 7],
                                      [2, 5, 8]
                                      ])
    end

    it "doesn't built in #transpose" do
      expect(row).not_to receive(:transpose)
      row.my_transpose
    end
  end

  describe "#stock_picker" do
    subject(:stock_prices) { [2,9,6,1,8,9,5,7,4] }
    it "returns pair of indices indicating most profitable buy/sell days" do
      expect(stock_prices.stock_picker).to eq([3, 5])
    end
  end


end
