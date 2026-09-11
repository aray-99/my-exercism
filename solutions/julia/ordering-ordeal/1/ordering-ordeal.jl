function sortquantity!(qty)
    inxs = sortperm(qty, rev=true)
    sort!(qty, rev=true)
    return inxs
end

function sortcustomer(cust, srtperm)
    return cust[srtperm]
end

function production_schedule!(cust, qty)
    p = sortquantity!(qty)
    oc = sortcustomer(cust, p)
    ip = invperm(p)
    return oc, ip
end
