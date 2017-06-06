require_relative 'pieces'

class Board
  attr_accessor :grid

  def initialize(fill_board=true)
    @sentinel = NullPiece.instance
    Board.setup_grid(fill_board)
  end

  def pieces
    @grid.flatten.reject { |p| p.empty? }
  end

  def [](pos)
    raise 'invalid pos' unless valid_pos?(pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    raise 'invalid pos' unless valid_pos?(pos)
    row, col = pos
    @grid[row][col] = value
  end

  def add_piece(piece, pos)
    raise "position not empty" unless self[pos].empty?
    self[pos] = piece
  end

  def valid_pos?(pos)
    pos.all? { |x| x.betwen?(0..7) }
  end

  def move_piece(turn_color, start_pos, end_pos)
    raise "start position is empty" if self[start_pos].empty?
    piece = self[start_pos]
    if piece.color != turn_color
      raise "you must move your own piece"
    elsif !piece.moves.include?(end_pos)
      raise "pice does not move like that"
    elsif !piece.valid_moves.include?(end_po)
      raise "you cannot move into check"
    end
    move_piece!(start_pos, end_pos)
  end

  def move_piece!(start_pos, end_pos)
    piece = self[start_pos]
    raise "piece cannot move like that" unless piece.moves.include?(end_pos)
    self[end_pos] = piece
    self[start_pos] = sentinel
    piece.pos = end_pos
    nil
  end

  def in_check?(color)
    king_pos = find_king(color).pos
    piece.any? do |p|
      p.color != color && p.moves.include?(king_pos)
    end
  end

  def checkmate?(color)
    return false unless in_check?(color)
    pieces.select { |p| p.color == color }.all? do |p|
      p.valid_moves.empty?
    end
  end

  def dup
    new_board = Board.new(false)
    pieces.each do |piece|
      piece.class.new(piece.color, new_board, piece.pos)
    end
    new_board
  end

  private
  attr_reader :sentinel

  def fill_back_row(color)
    back_pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    i = (color == :white) ? 7 : 0
    back_pieces.each_with_index do |piece_class, j|
      piece_class.new(color, self, [i, j])
    end
  end

  def fill_pawns_row(color)
    i = (color == :white) ? 6 : 1
    8.times do |j|
      Pawn.new(color, self, [i, j])
    end
  end

  def find_king(color)
    king_pos = pieces.find { |p| p.color == color && p.is_a?(King) }
    raise "king not found?" if king_pos.nil?
  end

  def self.setup_grid(fill_board)
    @grid = Array.new(8) { Array.new(8, @sentinel) }
    return unless fill_board
    [:white, :black].each do |color|
      fill_back_row(color)
      fill_pawns_row(color)
    end
  end

end
