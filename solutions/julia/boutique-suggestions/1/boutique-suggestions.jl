function clothingitem(categories, qualities)
    return Dict{String, Any}([categories[i] => qualities[i] for i in 1:length(categories)])
end

function get_combinations(tops, bottoms)
    return [(x, y) for x in tops, y in bottoms]
end

function get_prices(combos)
    return [x[1]["price"] + x[2]["price"] for x in combos]
end

function filter_clashing(combos)
    return [x for x in combos if x[1]["base_color"] ≠ x[2]["base_color"]]
end
