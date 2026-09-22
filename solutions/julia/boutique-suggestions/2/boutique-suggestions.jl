function clothingitem(categories, qualities)
    return Dict(zip(categories, qualities))
end

function get_combinations(tops, bottoms)
    return [(x, y) for x in tops, y in bottoms]
end

function get_prices(combos)
    return [top["price"] + bottom["price"] for (top, bottom) in combos]
end

function filter_clashing(combos)
    return [(top, bottom) for (top, bottom) in combos if top["base_color"] ≠ bottom["base_color"]]
end
