"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    input = lowercase(input)
    for char in 'a':'z'
        char in input || return false
    end
    return true
end

input = "the quick brown fox jumps over the lazy dog"
@show ispangram(input)