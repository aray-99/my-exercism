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

height = size(E)[1]
width = size(E)[2]

function frown!(E)
    mouth = copy(E[7:9, 7:12])
    for j in 1:6
        for i in 1:3
            E[i + 6, j + 6] = mouth[3 - (i - 1), j]
        end
    end
    return E
end

function frown(E)
    E_copy = copy(E)
    return frown!(E_copy)
end

function stickerwall(E)
    line = ones(1, width * 2)
    return vcat(hcat(E, frown(E)), line, hcat(frown(E), E))
end

function colpixelcount(E)
    row_line = ones(1, width * 2)
    col_line = ones(height, 1)
    
    sum_mat = sum(E, dims=1)
    return E .* sum_mat
end

function render(E)
    height = size(E)[1]
    width = size(E)[2]
    pixels = ""
    for i in 1:height
        pixels
        for j in 1:width
            pixels *= (E[i, j] > 0 ? "X" : " ")
        end
        if i in 1:(height-1) pixels *= "\n" end
    end
    return pixels
end
