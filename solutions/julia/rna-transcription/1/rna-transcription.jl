function to_rna(dna)
    prev = "ATGC"
    next = "UACG"
    mapping = Dict{Char, Char}(zip(prev, next))
    for char in dna
        if !(char in prev)
            throw(ErrorException("invalid dna"))
        end
    end
    String([mapping[c] for c in dna])
end

