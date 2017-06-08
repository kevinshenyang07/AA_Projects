require 'rspec'
require 'tdd'

describe Array do
  subject(:arr) { [1, 1, 5, 2, 3, 3] }

  describe '#my_uniq' do
    it 'does not modify original array' do
      arr.my_uniq
      expect(arr).to eq([1, 1, 5, 2, 3, 3])
    end

    it 'only returns unique values' do
      expect(arr.my_uniq).to eq(arr.uniq)
    end

    it 'returns empty array if array is empty' do
      expect([].my_uniq).to eq([])
    end
  end

  describe '#two_sum' do
    let(:arr) { [1, -1, -1, 2, -2] }

    it 'finds all pairs that sum to zero' do
      expect(arr.two_sum).to eq([[0, 1], [0, 2], [3, 4]].sort)
    end

    it 'should sort the pairs dictionary-wise' do
      expect(arr.two_sum).to eq([[0, 1], [0, 2], [3, 4]].sort)
    end
  end

  describe '#my_transpose' do
    let(:matrix) {[
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ]}

    it 'converts rows to columns' do
      expect(matrix.my_transpose).to eq([
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
      ])
    end

    it 'does not modify the original matrix' do
      matrix.my_transpose
      expect(matrix).to eq([
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ])
    end
  end

  describe '#stock_picker' do
    let(:stock_prices) { [20, 20000, 300, 9000000000, 5] }

    it 'returns most profitable pair' do
      expect(stock_picker(stock_prices)).to eq([0, 3])
    end

    it "doesn't sell before buying" do
      min, max = stock_picker(stock_prices)
      expect(min).to be < max
    end
  end
end
