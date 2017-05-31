require_relative 'tile.rb'

class Board
  attr_reader :grid

  def initialize(grid)
    @grid = grid

  end

  def self.from_file(fpath='sudoku.txt')
    lines = File.readlines(fpath).map(&:chomp)
    nums = lines.map(&:chars)
    nums.each do |row|
      row.each_with_index do |ele, idx|
        if ele.to_i == 0
          given = false
        else
          given = true
        end
        row[idx] = Tile.new(ele, given)
      end
    end
     nums
  end

  def render
    @grid.each do |row|
      p row.map(&:value)
    end
  end

end

if __FILE__ == $PROGRAM_NAME
   grid = Board.from_file
  game =  Board.new(grid)
   game.render
end
