module Nanoseconds

export NanoTime, NanoSpan

using Base.Dates
import Base.Dates: datetime2rata, rata2datetime,
    datetime2unix, unix2datetime,
    date2epochdays, epochdays2date

const IntTime = Int64

include "support/granular_consts.jl"
include "support/rata_conversion.jl"

include "type/Abstract.jl"
include "type/NanoTime.jl"
include "type/NanoSpan.jl"
include "type/convert.jl"

end # module