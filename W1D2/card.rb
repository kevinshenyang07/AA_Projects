class Card

  def initialize(value, face=false) # 0 = down; 1 = up
    @face = face
    @value = value
  end

  attr_accessor :face, :value

  def display
    if self.face == false
      nil
    else
      self.value
    end
  end

  def hide
    self.face = false
  end

  def reveal
    self.face = true
  end

  def to_s
    value.to_s
  end

  def ==(card)
    self.value == card.value
  end

end
