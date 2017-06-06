require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece
  include Slideable

  attr_reader :color, :board
  attr_accessor :pos

  def symbol
    '♝'.colorize(color)
  end

  protected

  def move_dirs
    digonal_dirs
  end


end
