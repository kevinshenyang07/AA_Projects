# require_relative 'pieces'
require 'colorize'

class Board
  attr_accessor :grid, :pieces

  def initialize
    @grid = Array.new(8){Array.new(8){"-"}}
  end

  def pieces
    @grid[0][0] = "R"
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def move_piece(start_pos, end_pos)
    row, col = end_pos
    raise "No piece at starting position" if self[start_pos] == "-"
    raise "Cannot move to end position" unless self[end_pos] == "-"
    raise "Cannot move to end position" if row < 0 || row > 7 || col < 0 || col > 7
    if self[end_pos] == "-"
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end
  end

  def render
  end



  # def place_pieces
  #   (0...board.length).each do |row|
  #     (0...board.length).each do |col|
  #       case [row, col]
  #       when [0,0] || [0,7] || [7,0] || [7,7]
  #         @board[row, col] = Rook.new
  #       when [0,1] || [0,6] || [7,1] || [7,6]
  #         @board[row, col] = Knight.new
  #       when [0,2] || [0,5] || [7,2] || [7,5]
  #         @board[row, col] = Bishop.new
  #       when [0,3] || [7,3]
  #         @board[row, col] = King.new
  #       when [0,4] || [7,4]
  #         @board[row, col] = Queen.new
  #       else
  #         @board[row,col] = Nullpiece.new
  #       end
  #     end
  #   end
  # end



end


if __FILE__ == $PROGRAM_NAME
  game = Board.new
  game.board
end
