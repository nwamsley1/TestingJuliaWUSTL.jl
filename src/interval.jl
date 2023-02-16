struct Interval
    lower::Number
    upper::Number
end

import Base.minimum
import Base.maximum
minimum(iv::Interval) = iv.lower
maximum(iv::Interval) = iv.upper
export Interval