import Base: (+), (-)

function (-)(x::Clock{I}, y::Clock{I}) where I<:IntTimes
    nanos = nanoseconds(x) - nanoseconds(y)
    return Span{I}(nanos)
end

(-)(x::Clock{I1}, y::Clock{I2}) where {I1<:IntTimes, I2<:IntTimes} = (-)(promote(x, y)...)
(-)(x::Clock{I}, y::DateTime) where I<:IntTimes = (-)(x, Clock{I}(y))
(-)(x::DateTime, y::Clock{I}) where I<:IntTimes = (-)(Clock{I}(x), y)
(-)(x::Clock{I}, y::Date) where I<:IntTimes = (-)(x, Clock{I}(y))
(-)(x::Date, y::Clock{I}) where I<:IntTimes = (-)(Clock{I}(x), y)
(-)(x::Clock{I}, y::Time) where I<:IntTimes = (-)(x, Span{I}(y))

(+)(x::Clock{I}, y::Time) where I<:IntTimes = (+)(x, Span{I}(y))
(+)(x::Time, y::Clock{I}) where I<:IntTimes = (+)(y, Span{I}(x))

for P in (:Nanosecond, :Microsecond, :Millisecond, :Second, :Minute, :Hour, :Day, :Week)
    @eval begin
        (+)(x::Clock{I}, p::$P) where I<:IntTimes = Clock{I}(nanosecs(x) + nanosecs(p))
        (+)(p::$P, x::Clock{I}) where I<:IntTimes = Clock{I}(nanosecs(x) + nanosecs(p))
        (-)(x::Clock{I}, p::$P) where I<:IntTimes = Clock{I}(nanosecs(x) - nanosecs(p))
    end
end
