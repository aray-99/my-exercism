# Define a custom type Fiberator
struct Fiberator
    n::Int
end

# Implement `iterate` method(s)
function Base.iterate(f::Fiberator, state=(1, 1, 1))
    a, b, index = state

    if index > f.n
        return nothing
    end

    return (a, (b, a + b, index + 1))
end

# Make `collect` work
Base.length(f::Fiberator) = f.n

# Enable Julia to infer element type
Base.eltype(::Type{Fiberator}) = Int
