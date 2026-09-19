demote(n::Float64) = ceil(UInt8, n)
demote(n::Integer) = convert(Int8, n)

preprocess(coll::AbstractVector) = reverse(demote.(coll))
preprocess(coll::AbstractSet) = sort([demote(x) for x in coll], rev=true)
