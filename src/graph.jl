function getNeighbors(graph, node)
    append!([node], graph[node])
end

export getNeighbors

function getComponent(graph, node)
    #Lists of neighbors that have and have not been explored
    unexplored_neighbors = getNeighbors(graph, node)
    explored_neighbors = Set{Int64}()

    #Current known members of the component
    component = Set(unexplored_neighbors)

    #Find new unexplored neighbors until there are none left to discover
    while length(unexplored_neighbors) > 0

        #Get the current node
        current_node = pop!(unexplored_neighbors)
        #Add the current node to the list of explored neighbors
        explored_neighbors = push!(explored_neighbors, current_node)
        #Get neighbors of the current node
        current_neighbors = Set(getNeighbors(graph, current_node))

        #Add any previously unseen nodes to the component
        component = union(
                            current_neighbors,
                            component
                        )
        #Add previously unexplored nodes to the list of unexplored neighbors
        unexplored_neighbors = setdiff(

                                        union(
                                                current_neighbors,
                                                unexplored_neighbors
                                             ), 

                                    explored_neighbors)
    end
    component
end

 export getComponent