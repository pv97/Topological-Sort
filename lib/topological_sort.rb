require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

# kahn
# def topological_sort(vertices)
#   ordered = []
#   queue = []
#   hash = {}
#
#   vertices.each do |vertex|
#     hash[vertex] = vertex.in_edges.count
#     queue << vertex if hash[vertex] == 0
#   end
#
#   until queue.empty?
#     current = queue.shift
#     ordered << current
#
#     current.out_edges.each do |edge|
#       child = edge.to_vertex
#       hash[child] -= 1
#       queue << child if hash[child] == 0
#     end
#   end
#
#   if ordered.length == vertices.length
#     return ordered
#   else
#     return []
#   end
# end

def topological_sort(vertices)
  ordering = []
  set = Set.new
  vertices.each do |vertex|
    dfs(ordering,set,vertex) unless set.include?(vertex)
  end
  ordering
end

def dfs(ordering,set,vertex)
  set.add(vertex)
  vertex.out_edges.each do |edge|
    next_vertex = edge.to_vertex
    dfs(ordering,set,next_vertex) unless set.include?(next_vertex)
  end
  ordering.unshift(vertex)
end
