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

export Interval
