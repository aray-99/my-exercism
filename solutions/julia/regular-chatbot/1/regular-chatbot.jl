function is_valid_command(msg)
    return occursin(r"^Chatbot.*"i, msg)
end

function remove_emoji(msg)
    return replace(msg, r"emoji\d*" => "")
end

function check_phone_number(number)
    re = r"^\(\+\d{2}\) \d{3}-\d{3}-\d{3}$"
    m = match(re, number)
    if isnothing(m)
        return "Oops, it seems like I can't reach out to $number"
    else
        return "Thanks! You can now download me to your phone."
    end
end

function getURL(msg)
    re = r"\w+\.\w+"
    matches = eachmatch(re, msg)
    return [m.match for m in matches]
end

function nice_to_meet_you(str)
    re = r"(\w+)\, (\w+)"
    m = match(re, str)
    name = "$(m[2]) $(m[1])"
    return "Nice to meet you, $name"
end
