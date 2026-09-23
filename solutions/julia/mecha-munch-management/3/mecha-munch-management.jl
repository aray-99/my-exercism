function additems!(cart, items)
    for key in items
        cart[key] = get(cart, key, 0) + 1
    end
    return cart
end

function update_recipes!(ideas, updates)
    merge!(ideas, updates)
end

function send_to_store(cart, aislecodes)
    return sort([aislecodes[food] => quantity for (food, quantity) in cart if haskey(aislecodes, food)])
end

function update_store_inventory!(inventory, cart)
    mergewith!(-, inventory, cart)
    return filter(x -> iszero(x.second), inventory)
end

function reorder!(outofstock, stock)
    for food in keys(outofstock)
        outofstock[food] = get(stock, food, 100)
    end
    return outofstock
end
