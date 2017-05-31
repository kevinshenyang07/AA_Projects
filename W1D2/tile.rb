class Tile
  attr_reader :value
  def initialize(value, given)
    value == "0" ? @value = "?" : @value = value
    @given = given
  end


end
