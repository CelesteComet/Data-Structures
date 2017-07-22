require_relative 'bst_node'
require_relative 'binary_search_tree'

arr = File.readlines('./test-set.rtf')
arr.map! { |el| el.to_i }
#
# def longest(arr)
#   tree = BinarySearchTree.new
#   arr.each do |el|
#     tree.insert(el)
#   end
#   p BinarySearchTree.find_longest_right(tree.root)
#   node = tree.root
#   current_node = [node]
#   max_node = nil
#   max_count = 0
#   until current_node.empty?
#     node_list = []
#     current_node.each do |node|
#       if node.left
#         node_list << node.left
#         len = BinarySearchTree.find_longest_right(node.left)
#         if len > max_count
#           max_node = node.left
#           max_count = len
#         end
#       end
#       if node.right
#         node_list << node.right
#         len = BinarySearchTree.find_longest_right(node.right)
#         if len > max_count
#           max_node = node.right
#           max_count = len
#         end
#       end
#     end
#     p max_count
#     current_node = node_list
#   end
#   ans = []
#   node = max_node
#   until node == nil
#     ans << node.value
#     node = node.right
#   end
#   p ans
# end

longest(arr)
