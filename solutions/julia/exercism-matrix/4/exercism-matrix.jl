const E = [
    0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0;
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    0 1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 1 0;
    0 1 0 0 1 0 1 0 0 0 0 1 0 1 0 0 1 0;
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
    0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0;
    0 1 0 0 0 0 0 1 0 0 1 0 0 0 0 0 1 0;
    0 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 0;
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0;
]

function frown!(E)
    E[[7, 9], :] = E[[9, 7], :]
    return E
end

function frown(E)
    E_copy = copy(E)
    return frown!(E_copy)
end

function stickerwall(E)
    w = size(E, 2)
    line = ones(1, w * 2)
    return vcat(hcat(E, frown(E)), line, hcat(frown(E), E))
end

function colpixelcount(E)
    return E .* sum(E, dims=1)
end

function render(E)
    pixels = (n -> iszero(n) ? ' ' : 'X').(E)
    return join(join.(eachrow(pixels)), "\n")
end
