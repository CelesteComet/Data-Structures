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
  end

  def delete(value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
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
  def delete_with_children(node, max_node)
  end

end
