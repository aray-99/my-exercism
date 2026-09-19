function demote(n::Union{Float64, Integer})
    if n isa Float64
        return ceil(UInt8, n)
    elseif n isa Integer
        return convert(Int8, n)
    end
end

function preprocess(coll::Union{Vector, Set})
    if coll isa Vector
        return reverse(demote.(coll))
    elseif coll isa Set
        return sort(collect(demote.(coll)), rev=true)
    end
end
