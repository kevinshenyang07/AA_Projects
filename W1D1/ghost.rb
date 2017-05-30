require "./player"
class Game

  def initialize(players, fragment='', dictionary=nil)
    @players = players
    @fragment = fragment
    @dictionary = dictionary
    @losses = Hash.new(0)
  end

  def play_round
    self.take_turn(self.current_player)
  end

  def current_player
    @players[0]
  end

  def previous_player
    @players[1]
  end

  def next_player!
    @players.reverse!
    current_player
  end

  def valid_play?(string)
    alphabet = ("a".."z").to_a
    alphabet.include?(string)
  end

  def lose?(string)
    @dictionary.include?(@fragment+string)
  end

  def take_turn(player)
    puts "Enter a letter: "
    input = gets.chomp.strip.downcase
    if valid_play?(input)
      if lose?(input)
        puts "You lose 1 game."
        self.losses[self.player] += 1
        if self.losses[self.player] >= 5
          puts "You're out."
          self.players.delete(self.player)
          if self.players.length == 1
            return nil
          end
        end
      else
        @fragment += input
      end
    else
      puts "Invalid move."
    end
    take_turn(self.next_player!)
  end




end

if __FILE__ == $PROGRAM_NAME
  p1 = Player.new('Clare')
  p2 = Player.new('Kevin')
  game = Game.new(players=[p1, p2], fragment='', dictionary=['ghost', 'human', 'beast'])
  game.play_round(game.current_player)
end
