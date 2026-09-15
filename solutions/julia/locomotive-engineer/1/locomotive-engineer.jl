function get_vector_of_wagons(args...)
    vec = (Int64)[]
    push!(vec, args...)
    return vec
end

function fix_vector_of_wagons(each_wagons_id, missing_wagons)
    first, second, third, more... = each_wagons_id
    return [third; missing_wagons; more...; first; second]
end

function add_missing_stops(route, stops...)
    new_route = Dict{String, Any}(route)
    new_route["stops"] = [stop.second for stop in stops]
    return new_route
end

function extend_route_information(route; more_route_information...)
    return merge(route, Dict(more_route_information))
end
