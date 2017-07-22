# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    new_node = BSTNode.new(value)
    if @root == nil
      @root = new_node
      new_node.parent = @root
    else
      insert_recursive(@root,new_node)
    end
  end

  def find(value, tree_node = @root)
    case tree_node.value <=> value
    when -1
      return nil if tree_node.right == nil
      find(value,tree_node.right)
    when 0
      return tree_node
    when 1
      return nil if tree_node.left == nil
      find(value,tree_node.left)
    end
  end

  def delete(value)
    node = find(value)
    return nil if node == nil
    return @root = nil if node == @root

    node.parent.delete(node)

    if node.right == nil || node.left == nil
      node.parent.insert(node.left) if node.right == nil && node.left
      node.parent.insert(node.right) if node.left == nil && node.right
    else
      max_node = maximum(node.left)
      delete_with_children(node, max_node)
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if tree_node.right == nil
    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    return 0 if tree_node == nil || (tree_node.left == nil && tree_node.right == nil)
    if tree_node.left == nil
      1 + depth(tree_node.right)
    elsif tree_node.right == nil
      1 + depth(tree_node.left)
    else
      1 + [depth(tree_node.left), depth(tree_node.right)].max
    end
  end

  def is_balanced?(tree_node = @root)
    return true if tree_node.empty?
    if tree_node.left == nil
      return true if depth(tree_node.right) <= 1
      return false
    elsif tree_node.right == nil
      return true if depth(tree_node.left) <= 1
      return false
    elsif (depth(tree_node.left) - depth(tree_node.right)).abs <= 1
      if (is_balanced?(tree_node.left) && is_balanced?(tree_node.right))
        return true
      end
    end
    false
  end
# 1. Check if the far left child has children, add to array if it does,
# 2. Go up to its parent add that, check for right side children.
#
  def in_order_traversal(tree_node = @root, arr = [])

    if tree_node.left != nil
      in_order_traversal(tree_node.left, arr)
    end

    arr << tree_node.value

    if tree_node.right != nil
      in_order_traversal(tree_node.right,arr)
    end

    arr
  end

  def minimum(node)
    return node if node.left == nil
    minimum(node.left)
  end

  def self.find_longest_right(tree_node)
    return 0 if tree_node == nil
    1 + find_longest_right(tree_node.right)
  end

  private
  # optional helper methods go here:
  def insert_recursive(root_node,new_node)
    if new_node.value <= root_node.value
      if root_node.left == nil
        root_node.left = new_node
        new_node.parent = root_node
      else
        insert_recursive(root_node.left,new_node)
      end
    else
      if root_node.right == nil
        root_node.right = new_node
        new_node.parent = root_node
      else
        insert_recursive(root_node.right,new_node)
      end
    end
  end
# Get max node
# replace parent node with max node
# replace max node with left node
# There will never be a right child for the max_node, since its the max
  def delete_with_children(node, max_node)
    node.parent.insert(max_node)
    max_node.parent.delete(max_node)
    max_node.parent.insert(maximum(max_node.left))
    max_node.left = node.left
  end

end
