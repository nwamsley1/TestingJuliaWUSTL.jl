struct Interval
    lower::Number
    upper::Number
    function Interval(l::Number, r::Number)
        if l<r 
            lower = l
            upper = r
        else
            lower = r
            upper = l
        end
        return new(lower, upper)
    end
end

import Base.minimum
import Base.maximum
minimum(iv::Interval) = iv.lower
maximum(iv::Interval) = iv.upper

import Base.∈
function ∈(N::Number, iv::Interval)
    if N>minimum(iv) && N<maximum(iv) true 
    else false
    end
end

import Base.isempty
function isempty(iv::Interval)
    minimum(iv)==maximum(iv) ? true : false
end

import Base.issubset
function issubset(ivl::Interval, ivr::Interval)
    minimum(ivl)>=minimum(ivr) && maximum(ivl)<=maximum(ivr) ? true : false
end

import Base.∩
import Base.length




function length(iv::Interval)
    return (maximum(iv) - minimum(iv))
end

#function iterate(iv::Interval)
#    zip((iv.lower, iv.upper))
#end

function ∩(ivl::Interval, ivr::Interval)
    print(ivl.lower)
    if (minimum(ivr) > maximum(ivl)) || (minimum(ivl) > maximum(ivr))
        return nothing
    end
    Interval(
            maximum(
                        (minimum(ivr), 
                        minimum(ivl))
                    ),
            minimum(
                (maximum(ivr), 
                maximum(ivl))
            )
            )
end

import Base.show
function show(io::IO, iv::Interval)
    if length(iv) == 0
        print(io, "\u2205")
    else
        print(io, "\u301a",iv.lower,",",iv.upper,"\u301b")
    end
end
 #   print("")
export Interval
