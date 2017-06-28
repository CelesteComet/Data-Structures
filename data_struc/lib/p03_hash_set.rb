require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) {Array.new}
    @count = 0
  end

  def insert(key)
    @count +=1
    self[key] << key
    resize! if count > num_buckets
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.dup
    @store = Array.new(num_buckets*2) {Array.new}
    @count = 0
    old_store.flatten.each do |val|
      self.insert(val)
    end
  end

  def [](num)
    @store[num.hash % num_buckets]
  end
end
