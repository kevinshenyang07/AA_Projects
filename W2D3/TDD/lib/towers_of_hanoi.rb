class TowersOfHanoi
  attr_accessor :piles

  def initialize
    @piles = [[1,2,3], [], []]
  end

  def start
    until won?
      display
      begin
        print "select the pile to take from: "
        pile = Integer(gets.chomp)
        print "select the pile to move to: "
        new_pile = Integer(gets.chomp)

        move(pile, new_pile)

      rescue StandardError
        puts "that's not a valid move"
        retry
      end
    end
    puts "you won!"
  end

  def display
    @piles.each do |pile|
      p pile
    end
  end

  def move(from, to)
    from_pile = @piles[from]
    to_pile = @piles[to]
    if from_pile.first.nil? || (!to_pile.first.nil? && from_pile.first > to_pile.first)
      raise StandardError
    else
      piece = from_pile.shift
      to_pile.unshift(piece)
    end
  end

  def won?
    (1...@piles.length).each do |pile|
      return true if @piles[pile] == [1, 2, 3]
    end
    false
  end


end

if __FILE__ == $PROGRAM_NAME
  TowersOfHanoi.new.start
end
