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

    multicomponent_graph = [
                                [2, 3],
                                [1, 4],
                                [1, 4],
                                [2, 3],
                                [4, 6, 7],
                                [7],
                                [6]
                            ]
    
    #Tests for 1)
    @test Set(getNeighbors(undirected_graph, 1)) == Set([1, 2, 3])
    @test Set(getNeighbors(undirected_graph, 4)) == Set([4, 5])
    @test Set(getNeighbors(directed_graph, 1)) == Set([1, 2, 3])
    #This test was actually wrong initially. 
    @test Set(getNeighbors(directed_graph, 5)) == Set([5])

    @test_throws BoundsError getNeighbors(undirected_graph, 6)
    @test_throws BoundsError getNeighbors(undirected_graph, 0)
    # Write your tests here.

    #Tests for 2)
    @test getComponent(multicomponent_graph, 1) == Set([1, 2, 3, 4])
    @test getComponent(multicomponent_graph, 2) == Set([1, 2, 3, 4])
    @test getComponent(multicomponent_graph, 3) == Set([1, 2, 3, 4 ])
    @test getComponent(multicomponent_graph, 4) == Set([1, 2, 3, 4])
    @test getComponent(multicomponent_graph, 5) == Set([1, 2, 3, 4, 5, 6, 7])
    @test getComponent(multicomponent_graph, 6) == Set([6, 7])
    @test getComponent(multicomponent_graph, 7) == Set([6, 7])

    #Test for 3)
    #This gets tricky with directed graphs. In the example, it is not
    #possible to reach 5 starting from any other node. But it is possible to 
    #reach all other nodes starting from 5. So the components overlap. 
    @test getAllComponents(multicomponent_graph) == [Set([1, 2, 3, 4]),
                                                     Set([1, 2, 3, 4, 5]),
                                                     Set([5, 6, 7]),
                                                     Set([6, 7])]
end
