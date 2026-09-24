function encode(s)
    encoded = ""
    if length(s) == 0 return encoded end
    cur = s[1]
    len = 0
    for char in s
        if char == cur
            len += 1
            continue
        end
        encoded *= (len == 1) ? "$cur" : "$len$cur"
        cur = char
        len = 1
    end
    encoded *= (len == 1) ? "$cur" : "$len$cur"
    return encoded
end

function decode(s)
    if length(s) < 2 return s end
    decoded = ""
    pos = 1
    while pos <= length(s)
        len = 1
        if isdigit(s[pos])
            digit_start = pos
            while pos <= length(s) && isdigit(s[pos])
                pos += 1
            end
            len = parse(Int, s[digit_start:pos - 1])
        end
        char = s[pos]
        decoded *= repeat(string(char), len)
        pos += 1
    end
    return decoded
end
