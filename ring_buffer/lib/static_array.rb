# This class just dumbs down a regular Array to be statically sized.
class StaticArray
  def initialize(length)
    @length = length
    @store = []
  end

  # O(1)
  def [](index)
    if @store[index] == nil
      raise "index out of bounds"
    else
      @store[index]
    end
  end

  # O(1)
  def []=(index, value)
    if index-1 > @length
      raise "index out of bounds"
    else
      @store[index] = value
    end
  end

  protected
  attr_accessor :store
end
