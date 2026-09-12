function time_to_mix_juice(juice)
    if juice == "Pure Strawberry Joy" return 0.5 end
    if juice == "Energizer" || juice == "Green Garden" return 1.5 end
    if juice == "Tropical Island" return 3 end
    if juice == "All or Nothing" return 5 end
    return 2.5
end

function wedges_from_lime(size)
    if size == "small" return 6 end
    if size == "medium" return 8 end
    if size == "large" return 10 end
end

function limes_to_cut(needed, limes)
    num = 0
    while (needed > 0 && num < length(limes))
        num += 1
        needed -= wedges_from_lime(limes[num])
    end
    return num
end

function order_times(orders)
    return time_to_mix_juice.(orders)
end

function remaining_orders(time_left, orders)
    times = order_times(orders)
    n = 1
    while (time_left > 0 && n <= length(times))
        time_left -= times[n]
        n += 1
    end
    return orders[n:end]
end
