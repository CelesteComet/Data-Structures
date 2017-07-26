# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    @root = insert_recursive(@root, value)
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    return tree_node if tree_node.value == value
    if tree_node.value > value
      find(value, tree_node.left)
    else
      find(value, tree_node.right)
    end
  end

  def delete(value)
    @root = delete_from_tree(@root,value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if tree_node.right == nil
    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    return 0 if tree_node.nil?


  end

  def is_balanced?(tree_node = @root)
  end
# 1. Check if the far left child has children, add to array if it does,
# 2. Go up to its parent add that, check for right side children.
#
  def in_order_traversal(tree_node = @root, arr = [])
  end

  def minimum(node)

  end

  def self.find_longest_right(tree_node)
  end

  private
  # optional helper methods go here:
  def insert_recursive(tree_node, value)
    return BSTNode.new(value) if tree_node == nil
    if tree_node.value >= value
      tree_node.left = insert_recursive(tree_node.left, value)
    else
      tree_node.right = insert_recursive(tree_node.right, value)
    end

    tree_node
  end
# Get max node
# replace parent node with max node
# replace max node with left node
# There will never be a right child for the max_node, since its the max

  def delete_from_tree(tree_node, value)
      node = find(value)
      remove(node)
      node
  end

  def remove(node)
    if node.left.nil? && node.right.nil?
      node = nil
    elsif node.left && node.right.nil?
      node = node.left
    elsif node.right && node.left.nil?
      node = node.right
    else
      delete_with_children(node)
    end
    node
  end

  def delete_with_children(node)
    max_node = maxiumum(node.left)
    max_node.parent.delete(max_node)
    node.parent.delete(node)
    node.parent.insert(max_node)
    max_node.insert(node.left)
    max_node.insert(node.right)
  end

end
