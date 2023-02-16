struct Interval
    lower::Number
    upper::Number
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

export Interval
