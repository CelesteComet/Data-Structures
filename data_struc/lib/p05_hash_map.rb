require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_reader :count

  def initialize(num_buckets = 8)

  end

  def include?(key)
  end

  def set(key, val)
  end

  def get(key)

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
  end

  def resize!
  end

  def bucket(key)
  end
end