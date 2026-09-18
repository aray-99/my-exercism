cleanupname(name) = name |> (s -> replace(s, "-" => " ")) |> strip

firstletter = string ∘ first ∘ cleanupname

function initial(name)
    return "$(name |> firstletter |> uppercase)."
end

function couple(name1, name2)
    return "❤ $(initial(name1))  +  $(initial(name2)) ❤"
end
