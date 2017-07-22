require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @capacity = 8
    @length = 0
    @start_idx = 0
  end

  # O(1)
  def [](index)
    @store[check_index(index)]
  end

  # O(1)
  def []=(index, val)
    @store[check_index(index)] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length < 1
    pop_val = self[@length-1]
    @length -= 1
    pop_val
  end

  # O(1) ammortized
  def push(val)
    resize! if @length == @capacity
    self[@length] = val
    @length += 1
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length < 1
    shift_val = self[0]
    @start_idx = (@start_idx + 1) % @capacity
    @length -= 1
    shift_val
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @length == @capacity
    if @start_idx > 0
      @start_idx -= 1
    else
      @start_idx = @capacity-1
    end
    self[0] = val
    @length += 1
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    (index+@start_idx) % @capacity
  end

  def resize!
    new_store = StaticArray.new(@capacity*2)
    (0...@length).step do |i|
      new_store[i] = self[i]
    end
    @store = new_store
    @start_idx = 0
    @capacity *= 2
  end
end
