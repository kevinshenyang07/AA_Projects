class StaticArray
  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    @store[i]
  end

  def []=(i, val)
    validate!(i)
    @store[i] = val
  end

  def length
    @store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, @store.length - 1)
  end
end

class DynamicArray
  attr_reader :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    if i > self.capacity
      nil
    else
      @store[i]
    end
  end

  def []=(i, val)
    until i <= self.capacity
      resize!
    end
    @store[i] = val
    @count += 1
  end

  def capacity
    @store.length
  end

  def include?(val)
    self.each do |el|
      if el == val
        return true
      end
    end
    false
  end

  def push(val)
    
  end

  def unshift(val)
  end

  def pop
  end

  def shift
  end

  def first
  end

  def last
  end

  def each
    (0..self.capacity-1).each do |i|
      unless self[i].nil?
        yield self[i]
      end
    end
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    @count = 0
    old_store = @store
    @store = Array.new(self.capacity * 2)
    old_store.each { |el| @store.push(el) }
    @store
  end
end
