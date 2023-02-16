using TestingJuliaWUSTL
using Test
@testset "interval.jl" begin
    custom_interval_a = Interval(1, 63)
    custom_interval_b = Interval(1.0, 62.56)

    @test minimum(custom_interval_a) == 1
    @test maximum(custom_interval_a) == 63
    @test minimum(custom_interval_b) == 1.0
    @test maximum(custom_interval_b) == 62.56
end