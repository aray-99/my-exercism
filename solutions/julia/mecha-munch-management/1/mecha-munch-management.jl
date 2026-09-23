function additems!(cart, items)
    for key in items
        cart[key] = get(cart, key, 0) + 1
    end
    return cart
end

function update_recipes!(ideas, updates)
    return merge!(ideas, updates)
end

function send_to_store(cart, aislecodes)
    store = Dict{Float64, Int64}()
    for (food, code) in aislecodes
        if haskey(cart, food)
            store[code] = cart[food]
        end
    end
    return sort!(collect(store))
end

function update_store_inventory!(inventory, cart)
    for (food, quantity) in cart
        inventory[food] -= quantity
    end
    return filter(x -> iszero(x.second), inventory)
end

function reorder!(outofstock, stock)
    new_stork = Dict{String, Int64}()
    for key in keys(outofstock)
        new_stork[key] = 100
    end
    stock = merge(new_stork, stock)
    for (key, val) in outofstock
        outofstock[key] = stock[key]
    end
    return outofstock
end
