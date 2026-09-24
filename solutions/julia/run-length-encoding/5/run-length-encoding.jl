function encode(s)
    chars, n, encoded = collect(s), length(s), IOBuffer()
    pos = 1
    while pos <= n
        next = pos + 1
        while next <= n && chars[next] == chars[pos]
            next += 1
        end
        count = next - pos
        count > 1 && print(encoded, count)
        print(encoded, chars[pos])
        pos = next
    end
    String(take!(encoded))
end

function decode(s)
    chars, n, decoded = collect(s), length(s), IOBuffer()
    pos = 1
    while pos <= n
        next = pos
        while next <= n && isdigit(chars[next])
            next += 1
        end
        count = (next == pos) ? 1 : parse(Int, String(chars[pos:next - 1]))
        print(decoded, repeat(string(chars[next]), count))
        pos = next + 1
    end
    String(take!(decoded))
end
