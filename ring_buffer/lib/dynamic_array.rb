require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @length = 0
    @capacity = 8
  end

  # O(1)
  def [](index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    @store[index] = value
  end

  # O(1)
  def pop
    if @length < 1
      raise "index out of bounds"
    end
    @length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length == @capacity
    self[length] = val
    @length += 1
    nil
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length < 1
    old_store = @store
    @store = StaticArray.new(@capacity)
    if @length >= 2
      self[0] = old_store[1]
      if @length-2 >= 1
        (1..@length-2).step { |idx| self[idx] = old_store[idx+1] }
      end
    end
    @length -= 1
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    if @length == @capacity
      resize!
    else
      old_store = @store
      @store = StaticArray.new(@capacity)
      (0..@length-1).step do |idx|
        self[idx+1] = old_store[idx]
      end
    end
    self[0] = val
    @length += 1
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    old_store = @store
    @capacity *= 2
    @store = StaticArray.new(@capacity)
    (0..@capacity/2-1).step do |idx|
      self[idx+1] = old_store[idx]
    end
  end
end
