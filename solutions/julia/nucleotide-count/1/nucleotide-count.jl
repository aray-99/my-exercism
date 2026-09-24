"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    s = Dict(['A'=> 0, 'T'=>0, 'G'=>0, 'C'=>0])
    for char in strand
        if char in "ATGC"
            s[char] += 1
        else
            throw(DomainError(char))
        end
    end
    return s
end

@show count_nucleotides("")