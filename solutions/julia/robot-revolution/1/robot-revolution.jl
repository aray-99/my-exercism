using LinearAlgebra

rot2d(θ) = [
    cos(θ) -sin(θ);
    sin(θ) cos(θ)
]

normalize(vector) = vector / norm(vector)

function orientrobot(vecs)
    vecs = [v ./ norm(v) for v in vecs]
    return stack(vecs)
end

function rotaterobot(orientation, θ)
    return rot2d(θ) * orientation
end

function robotoriented(orientation, direction)
    return normalize(orientation[:,2]) ⋅ normalize(direction) ≈ 1
end

function bodylocation(orientation, position)
    return orientation .+ position
end
