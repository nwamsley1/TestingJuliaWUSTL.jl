function getNeighbors(graph, node)
    append!([node], graph[node])
end
export getNeighbors