using TestingJuliaWUSTL
using Test
@testset "interval.jl" begin
    #Tests for part1
    custom_interval_a = Interval(1, 63)
    custom_interval_b = Interval(1.0, 62.56)
    custom_interval_c = Interval(62.56, 62.56)

    @test minimum(custom_interval_a) == 1
    @test maximum(custom_interval_a) == 63
    @test minimum(custom_interval_b) == 1.0
    @test maximum(custom_interval_b) == 62.56
    #Tests for part 2
    @test (10 ∈ custom_interval_a) == true
    @test (10.0 ∈ custom_interval_a) == true
    @test (100.0 ∈ custom_interval_a) == false

    @test (10 ∈ custom_interval_b) == true
    @test (10.0 ∈ custom_interval_b) == true
    @test (100.0 ∈ custom_interval_b) == false

    #Tests for part3
    @test (isempty(custom_interval_c)) == true
    @test (isempty(custom_interval_a)) == false
    @test (isempty(custom_interval_b)) == false

    #Tests for part4
    @test (issubset(Interval(1, 10), Interval(-10, 100))) == true
    @test (issubset(Interval(-10, 100), Interval(1, 10))) == false
    @test (issubset(Interval(10, 100), Interval(10, 100))) == true

    #Tests for part5
    @test (intersection(Interval(1, 10), Interval(-10, 100))) == Interval(1, 10)
    @test (intersection(Interval(-10, 100), Interval(1, 10))) == Interval(1, 10)
    @test (intersection(Interval(10, 100), Interval(10, 100))) == Interval(1, 100)
    @test (intersection(Interval(-10, 100), Interval(10, 200))) == Interval(10, 100)
    @test (intersection(Interval(10, 200), Interval(-10, 100))) == Interval(10, 100)
    

end