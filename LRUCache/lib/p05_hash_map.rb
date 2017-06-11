require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    resize! if @count >= num_buckets

    bucket = bucket(key)
    if bucket.include?(key)
      bucket.update(key, val)
    else
      bucket.append(key, val)
      @count += 1
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    @count -= 1 if self.include?(key)
    bucket(key).remove(key)
  end

  def each
    @store.each do |bucket|
      bucket.each do |link|
        yield [link.key, link.val]
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_size = 2 * num_buckets
    @count = 0
    old_hash = @store
    @store = Array.new(new_size) { LinkedList.new }
    old_hash.each do |bucket|
      bucket.each do |link|
        self.set(link.key, link.val)
      end
    end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    idx = key.hash % @store.length
    @store[idx]
  end
end
