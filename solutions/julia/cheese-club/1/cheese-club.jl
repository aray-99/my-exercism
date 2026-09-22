function all_15(ratings)
    return all(x -> x == 1 || x == 5, ratings)
end

function emphatics(customers)
    return filter(c -> all_15(c.second), customers)
end

function tobinary(ratings)
    return map(x -> x == 1 ? 0 : 1, ratings)
end

function tobinarymatrix(ratings)
    mapreduce(tobinary ∘ transpose, vcat, ratings)
end
