using TestingJuliaWUSTL
using Test

@testset "graph.jl" begin
    #Example graph for tests
    #This graph is symmetric
    undirected_graph = [
                            [2, 3],
                            [1],
                            [1],
                            [5],
                            [4]
                        ]
    #This graph is not symmetric                  
    directed_graph = [
                        [2, 3],
                        [3],
                        [2],
                        [5],
                        []
                     ]
    #Tests for 1)
    @test Set(getNeighbors(undirected_graph, 1)) == Set([1, 2, 3])
    @test Set(getNeighbors(undirected_graph, 4)) == Set([4, 5])
    @test Set(getNeighbors(directed_graph, 1)) == Set([1, 2, 3])
    @test Set(getNeighbors(directed_graph, 5)) == Set([])

    @test_throws BoundsError getNeighbors(undirected_graph, 6)
    @test_throws BoundsError getNeighbors(undirected_graph, 0)
    # Write your tests here.
end
