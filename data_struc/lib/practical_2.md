## Problem
This is a two part problem:
1. First, write a series of instructions on how to build out an LRU Cache (pretend
the person you're writing to has no idea how to build one. Don't forget to address
the reasoning behind using particular data structures).
2. Implement an LRU Cache from scratch with no outside references. **Don't look
at the code or instructions from your homework!**

## Solution

### Part 1
Write first part here:
1. Initialize a hash_map as the map to store linked lists.
2. Initialize a store that is a linked_list holds the order of buckets.
3. Initialize a max and counter to signify the max space.
4. Create an update method that will update the value of the node and
    move the node to the end of the store.
5. Create a set method that will add the key to the map and store
6. Create a resize method that will resize the hash_map to twice the length
   of the map
7. Create a setter method that receives a key as an input and will update
   if the key is already included and append if its not included

### Part 2
```ruby
class LRUCache

  def initialize(max, prc)
    @map = HashMap.new(8)
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.length
  end

  def set(key)
    if @map[key]
      node = @map[key]
      update!(node)
    else
      calc(key)
      resize! if @count > @max
    end
  end

  def update!(node)
    node.remove
    val = node.val
    @store.append(node,val)
  end

  def calc(key)
    val = @prc.call(key)
    new_node = @store.append(key,val)
    @map[key] = new_node
    val
  end

  def eject
    node = @store.last
    node.remove
    @map.delete(node)
  end

end
```
