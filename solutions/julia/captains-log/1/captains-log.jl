function random_planet()
    return rand(['D', 'H', 'J', 'K', 'L', 'M', 'N', 'R', 'T', 'Y'])
end

function random_ship_registry_number()
    return "NCC-$(rand(1000:9999))"
end

function random_stardate()
    return rand() * 1000 + 41000
end

function random_stardate_v2()
    return rand(41000:0.1:42000)
end

function pick_starships(starships, number_needed)
    vec = []
    while (length(vec) < number_needed)
        id = rand(starships)
        if !(id in vec)
            push!(vec, id)
        end
    end
    return vec
end
