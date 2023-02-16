using TestingJuliaWUSTL
using Documenter

DocMeta.setdocmeta!(TestingJuliaWUSTL, :DocTestSetup, :(using TestingJuliaWUSTL); recursive=true)

makedocs(;
    modules=[TestingJuliaWUSTL],
    authors="nwamsley1 <n.t.wamsley@wustl.edu> and contributors",
    repo="https://github.com/nwamsley1/TestingJuliaWUSTL.jl/blob/{commit}{path}#{line}",
    sitename="TestingJuliaWUSTL.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://nwamsley1.github.io/TestingJuliaWUSTL.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/nwamsley1/TestingJuliaWUSTL.jl",
    devbranch="main",
)
