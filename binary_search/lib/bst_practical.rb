
def kth_largest(tree_node, k)
  arr = []
  in_order_traversal(tree_node, arr)
  arr[k-1]
end

def in_order_traversal(tree_node, arr = [])
  arr << tree_node
  if tree_node.right != nil
    in_order_traversal(tree_node.right, arr)
  end

  if tree_node.left != nil
    in_order_traversal(tree_node.left,arr)
  end

end

[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
