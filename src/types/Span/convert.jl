function Span{I}(x::Time) where I<:IntTimes
    return Span(I(x.instant.value))
end

@inline Span(x::Time) = Span{Int64}(dt)

function Span{I}(x::CompoundPeriod) where I<:IntTimes
    nanosecs = I(sum(map(a->Nanosecond(a), x.periods)))
    return Span(nanosecs.value)
end

@inline Span(x::CompoundPeriod) = Span{Int64}(x)

Span(x::Day)  = Span{Int64}(x.value * NANOSECONDS_PER_DAY)
Span(x::Hour) = Span{Int64}(x.value * NANOSECONDS_PER_HOUR)
Span(x::Minute) = Span{Int64}(x.value * NANOSECONDS_PER_MINUTE)
Span(x::Second) = Span{Int64}(x.value * NANOSECONDS_PER_SECOND)
Span(x::Millisecond) = Span{Int64}(x.value * NANOSECONDS_PER_MILLISEC)
Span(x::Microsecond) = Span{Int64}(x.value * NANOSECONDS_PER_MICROSEC)
Span(x::Nanosecond)  = Span{Int64}(x.value)

Span{Int64}(x::Day)  = Span{Int64}(x.value * NANOSECONDS_PER_DAY)
Span{Int64}(x::Hour) = Span{Int64}(x.value * NANOSECONDS_PER_HOUR)
Span{Int64}(x::Minute) = Span{Int64}(x.value * NANOSECONDS_PER_MINUTE)
Span{Int64}(x::Second) = Span{Int64}(x.value * NANOSECONDS_PER_SECOND)
Span{Int64}(x::Millisecond) = Span{Int64}(x.value * NANOSECONDS_PER_MILLISEC)
Span{Int64}(x::Microsecond) = Span{Int64}(x.value * NANOSECONDS_PER_MICROSEC)
Span{Int64}(x::Nanosecond)  = Span{Int64}(x.value)

Span{Int128}(x::Day)  = Span(Int128(x.value * NANOSECONDS_PER_DAY))
Span{Int128}(x::Hour) = Span(Int128(x.value * NANOSECONDS_PER_HOUR))
Span{Int128}(x::Minute) = Span(Int128(x.value * NANOSECONDS_PER_MINUTE))
Span{Int128}(x::Second) = Span(Int128(x.value * NANOSECONDS_PER_SECOND))
Span{Int128}(x::Millisecond) = Span{Int128(x.value * NANOSECONDS_PER_MILLISEC))
Span{Int128}(x::Microsecond) = Span(Int128(x.value * NANOSECONDS_PER_MICROSEC))
Span{Int128}(x::Nanosecond)  = Span(Int128(x.value))


function Span(; days::Int64=0,
                    hours::Int64=0,
                    minutes::Int64=0,
                    seconds::Int64=0,
                    milliseconds::Int64=0,
                    microseconds::Int64=0,
                    nanoseconds::Int64=0)
    dnanosec = nanoseconds
    dnanosec += microseconds * NANOSECONDS_PER_MICROSECOND
    dnanosec += milliseconds * NANOSECONDS_PER_MILLISECOND
    dnanosec += seconds * NANOSECONDS_PER_SECOND
    dnanosec += minutes * NANOSECONDS_PER_MINUTE
    dnanosec += hours * NANOSECONDS_PER_HOUR
    dnanosec += days * NANOSECONDS_PER_DAY
    return Span(dnanosec)
end

function Span(x::DateTime)
    error("use Clock(x::DateTime), not Span(x::DateTime)")
end
