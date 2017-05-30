class Player
  def initialize(name)
    @name = name
  end

  def guess
    input = gets.chomp.strip.downcase
  end

  def alert_invalid_guess(input)
    alphabet = ("a".."z").to_a
    if !alphabet.include?(input)
      puts "Invalid input."
    end
  end
end
