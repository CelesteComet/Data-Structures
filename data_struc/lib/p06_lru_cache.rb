require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new(max)
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      node = @map.get(key)
      update_node!(node)
    else
      eject! if count >= @max
      node = calc!(key)
    end
      node.val
  end

  def to_s
    "Map: " + map.to_s + "\n" + "Store: " + store.to_s
  end

  private
  attr_reader :store, :map

  def calc!(key)
    val = @prc.call(key)
    node = @store.append(key,val)

    @map.set(key,node)
    node
  end

  def update_node!(node)
    @map.delete(node.key)
    @store.remove(node.key)
    new_node = @store.append(node.key, node.val)
    @map.set(node.key,new_node)
    new_node
  end

  def eject!
    node = @store.first
    node.remove
    @map.delete(node.key)
    nil
  end
end
