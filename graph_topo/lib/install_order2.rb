require_relative 'topological_sort'
require_relative 'graph'

# In this version of the problem, all packages will be listed, including
# independent ones (independant packages have nil or no value for their
# dependencies), but the package ids may not be numbers.
def install_order2(arr)
  arr.select! {|el| el[1] }
  hash = {}
  arr.each do |package|
    hash[package[0]] = Vertex.new(package[0]) unless hash[package[0]]
    hash[package[1]] = Vertex.new(package[1]) unless hash[package[1]]
    Edge.new(hash[package[1]],hash[package[0]])
  end
  topological_sort(hash.values).map {|vert| vert.value }
end

arr = [[3, 1], [2, 1], [6, 5], [3, 6], [3, 2], [4, 3], [9, 1], [1, nil], [5, nil]]
arr2 = [['a', 'b'], ['c', 'b'], ['d', 'a'], ['b'], ['e', 'd']]
arr3 = [[3,1],[2,1],[6,5],[3,6],[3,2],[4,3],[9,1]]

p install_order2(arr)
p install_order2(arr2)
p install_order2(arr3)
