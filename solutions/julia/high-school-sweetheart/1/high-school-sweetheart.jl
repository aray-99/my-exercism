function cleanupname(name)
    strip(replace(name, "-" => " "))
end

function firstletter(name)
    string(cleanupname(name)[1])
end

function initial(name)
    return "$(uppercase(firstletter(name)))."
end

function couple(name1, name2)
    return "❤ $(initial(name1))  +  $(initial(name2)) ❤"
end
