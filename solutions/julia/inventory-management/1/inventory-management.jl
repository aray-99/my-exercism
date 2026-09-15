# original function
function init_and_increment(inventory, item)
    if haskey(inventory, item)
        inventory[item] += 1
    else
        inventory[item] = 1
    end
end

# ---

function create_inventory(items)
    inventory = Dict()
    for item in items
        init_and_increment(inventory, item)
    end
    return inventory
end

function add_items(inventory, items)
    for item in items
        init_and_increment(inventory, item)
    end
    return inventory
end

function decrement_items(inventory, items)
    for item in items
        if !haskey(inventory, item) || inventory[item] == 0
            continue
        else
            inventory[item] -= 1
        end
    end
    return inventory
end

function remove_item(inventory, item)
    if haskey(inventory, item)
        delete!(inventory, item)
    end
    return inventory
end

function list_inventory(inventory)
    vec = []
    for (k, v) in inventory
        if v == 0
            continue
        end
        push!(vec, k => v)
    end
    return sort!(vec)
end
