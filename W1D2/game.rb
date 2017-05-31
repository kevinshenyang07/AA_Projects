require 'byebug'
require_relative 'card'
require_relative 'board'

class Game

  attr_reader :board

  def initialize(board)
    @board = board
    @previous_guess = nil
  end

  def start
    board.populate
  end

  def play
    start
    board.render
    until over?
      pos = input
      make_guess(pos)
    end
  end

  def over?
    board.won?
  end

  def make_guess(pos)
    current = board.reveal(pos)
    board.render
    byebug
    if @previous_guess.nil?
       @previous_guess = pos
    elsif current != board[@previous_guess].value
       board[pos].hide
       board[@previous_guess].hide
       board.render
       @previous_guess = nil
     else
       @previous_guess = nil
    end
    # @previous_guess = pos
  end

  def input
    puts 'Input your guess of row #:'
    # raise error if input is not numbers
    i = gets.chomp.to_i
    puts 'Input your guess of column #'
    j = gets.chomp.to_i
    [i, j]
  end

end


if __FILE__ == $PROGRAM_NAME
  board = Board.new(2, 2)
  game = Game.new(board)
  game.play
end
