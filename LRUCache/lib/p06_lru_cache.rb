require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      link = @map[key]
      update_link!(link)
      link.val
    else
      calc!(key)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    eject! if @max == @map.count
    val = @prc.call(key)
    link = @store.append(key, val)
    @map[key] = link
    val
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
    link.remove
    @store.append(link.key, link.val)
  end

  def eject!
    oldest = @store.first
    @map.delete(oldest.key)
    oldest.remove
  end
end
