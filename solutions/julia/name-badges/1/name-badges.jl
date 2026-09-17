function print_name_badge(id, name, department)
    return (ismissing(id) ? "" : "[$id] - ") * "$name - " * (isnothing(department) ? "OWNER" : uppercase(department))
end

function salaries_no_id(ids, salaries)
    sum = 0
    for i in 1:length(ids)
        if ismissing(ids[i])
            sum += salaries[i]
        end
    end
    return sum
end
