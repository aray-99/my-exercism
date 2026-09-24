"Your optional docstring here"
function distance(a, b)
    if length(a) ≠ length(b)
        throw(ArgumentError("different strand lengths"))
    end
    d = 0
    for (x, y) in zip(a, b)
        if x ≠ y
            d += 1
        end
    end
    return d
end
