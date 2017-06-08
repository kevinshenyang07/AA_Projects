class Array
  def my_uniq
    res = []
    self.each do |el|
      unless res.include?(el)
        res.push(el)
      end
    end
    res
  end

  def two_sum
    res = []
    (0...self.length-1).each do |i|
      (i+1...self.length).each do |j|
        if self[i] + self[j] == 0
          res.push([i, j])
        end
      end
    end
    res
  end

  def my_transpose
    result = Array.new(self.length) { [] }

    (0...self.length).each do |i|
      (0...self.length).each do |j|
        result[j].push(self[i][j])
      end
    end
    result
  end
end

def stock_picker(prices)
  best_pair = nil
  best_profit = 0

  (0...prices.length-1).each do |i|
    (i+1...prices.length).each do |j|
      if prices[j] - prices[i] > best_profit
        best_pair = [i, j]
        best_profit = prices[j] - prices[i]
      end
    end
  end
  best_pair
end
