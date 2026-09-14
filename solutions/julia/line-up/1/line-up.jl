function ordinal_numeral(number)
    if number % 100 in (11, 12, 13)
        return "$(number)th"
    end
    last = number % 10
    if last == 1
        return "$(number)st"
    elseif last == 2
        return "$(number)nd"
    elseif last == 3
        return "$(number)rd"
    else
        return "$(number)th"
    end
end

function line_up(name, number)
    return "$(name), you are the $(ordinal_numeral(number)) customer we serve today. Thank you!"
end
