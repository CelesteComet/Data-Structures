require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  p vertices.map {|v| v.value}
  sorted = []
  queue = []
  vertices.each do |vert|
    queue << vert if vert.in_edges.length == 0
  end
  until queue.empty?
    p 'queue'
    p queue.map {|v| v.value}
    current = queue.pop
    sorted << current
    neighbor_verts = []
    current.out_edges.each do |edge|
      neighbor_verts << edge.to_vertex
      edge.destroy!
    end
    p neighbor_verts.map {|v| v}
    neighbor_verts.each do |vert|
      queue.unshift(vert) if vert.in_edges.length == 0
    end
  end
  p sorted.map {|v| v.value}
  sorted

end
