function encode(s)
    chars = collect(s)
    isempty(chars) && return ""

    io = IOBuffer()
    start = 1
    n = length(chars)

    for i in 2:(n + 1)
        if i > n || chars[i] != chars[start]
            count = i - start

            if count == 1
                print(io, chars[start])
            else
                print(io, count, chars[start])
            end

            start = i
        end
    end

    return String(take!(io))
end

function decode(s)
    chars = collect(s)
    isempty(chars) && return ""

    io = IOBuffer()
    i = 1
    n = length(chars)

    while i <= n
        count = 1

        if isdigit(chars[i])
            start = i

            while i <= n && isdigit(chars[i])
                i += 1
            end

            count = parse(Int, String(chars[start:i-1]))
        end

        print(io, repeat(string(chars[i]), count))
        i += 1
    end

    return String(take!(io))
end