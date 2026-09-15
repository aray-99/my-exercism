function transform(ch)
    if ch == '-'
        return "_"
    elseif ch == ' ' || isdigit(ch)
        return ""
    elseif isuppercase(ch)
        return "-$(lowercase(ch))"
    elseif 'α' <= ch <= 'ω'
        return "?"
    end
    return string(ch)
end

function clean(str)
    return prod([transform(ch) for ch in collect(str)])
end
