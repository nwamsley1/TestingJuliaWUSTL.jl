struct Interval
    lower::Number
    upper::Number
end

#Constructor for interval type
function Interval(l::Number, r::Number)
    if l<r 
        lower = l
        upper = r
    else
        lower = r
        upper = l
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

#import Base.iterate
function length(iv::Interval)
    maximum(iv) - minimum(iv)
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
f#unction show(iv::Interval)
 #   print("")
export Interval
