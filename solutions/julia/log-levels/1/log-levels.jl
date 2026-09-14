function message(msg)
    parts = split(msg, ":")
    return strip(parts[2])
end

function log_level(msg)
    parts = split(msg, ":")
    return lowercase(parts[1][begin+1:end-1])
end

function reformat(msg)
    return "$(message(msg)) ($(log_level(msg)))"
end
