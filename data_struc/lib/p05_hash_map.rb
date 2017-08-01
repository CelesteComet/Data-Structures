require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
  end

  def include?(key)
    @store[bucket(key)].include?(key)
  end

  def set(key, val)
    if include?(key)
      @store[bucket(key)].update(key,val)
    else
      @store[bucket(key)].append(key,val)
    end
  end

  def get(key)
    if include?(key)
      @store[bucket(key)].get(key)
    end
  end

  def delete(key)
  end

  def each
  end

  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k} => #{v}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :inspect, :to_s
  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    key.hash % num_buckets
  end
end
