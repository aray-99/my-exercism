function bob(stimulus)
    s = strip(stimulus)
    if s == ""
        return "Fine. Be that way!"
    end

    is_yelling = any(isletter, s) && s == uppercase(s)
    is_question = endswith(s, "?")

    if is_yelling && is_question
        return "Calm down, I know what I'm doing!"
    elseif is_yelling
        return "Whoa, chill out!"
    elseif is_question
        return "Sure."
    else
        return "Whatever."
    end
    
end
