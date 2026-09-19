function z(x, y)
    return complex(x, y)
end

function euler(r, θ)
    return r * cis(θ)
end

function rotate(x, y, θ)
    return reim(z(x, y) * cis(θ))
end

function rdisplace(x, y, r)
    l = abs(z(x, y))
    return reim(z(x, y) * (1 + r / l))
end

function findsong(x, y, r, θ)
    x, y = rotate(x, y, θ)
    return rdisplace(x, y, r)
end
