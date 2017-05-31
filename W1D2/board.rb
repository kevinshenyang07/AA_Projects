require 'byebug'
require_relative 'card.rb'

class Board
attr_reader :grid
  def initialize(row=4, col=4)
    @row = row
    @col = col
    @grid = Array.new(row) { Array.new(col) }
  end

  def populate()
    # make pairs of cards and shuffle
    total_pairs = @row * @col / 2
    vals = ((97..total_pairs + 96).map(&:chr).to_a * 2).shuffle
    grid.each_with_index do |row, idx|
      row.each_index do |idx_2|
        # debugger
        val = vals.pop()
        card = Card.new(val)
        # put cards into grid
        # self[[idx, idx_2]] = card
        self.grid[idx][idx_2] = card
      end
    end
  end

  def render
    grid.each do |row|
      outputs = row.map {|card| card.face ? card.value : "$"}
      p outputs.join(' | ')
    end
    print "\n"
  end

  def won?
    grid.each do |row|
      unless row.all? {|card| card.face}
        return false
      end
    end
    true
  end

  def reveal(guessed_pos)
    unless self[guessed_pos].face
      self[guessed_pos].reveal
      self[guessed_pos].value
    end
  end

  def [] (pos)
    row, column = pos
    grid[row][column]
  end

  def []= (pos, value)
    row, column = pos
    grid[row][column] = value
  end

end
