class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
  end

end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)

  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |node|
      p node
      return node[key] if node.key == key
    end
  end

  def include?(key)
    self.each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, val)
    node = Node.new(key,val)
    if empty?
      @head.next, node.prev = node, @head
      @tail.prev, node.next = node, @tail
    else
      old_node = @tail.prev
      old_node.next, node.prev = node, old_node
      @tail.prev, node.next = node, @tail
    end

  end

  def update(key, val)

  end

  def remove(key)
  end

  def each
    node = @head.next
    until node == @tail
      yield(node)
      node = node.next
    end

  end

  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
