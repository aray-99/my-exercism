function today(birds_per_day)
    return birds_per_day[end]
end

function increment_todays_count(birds_per_day)
    birds_per_day[end] += 1
    return birds_per_day
end

function has_day_without_birds(birds_per_day)
    return any(birds_per_day .== 0)
    # ok = false
    # for i = 1:length(birds_per_day)
    #     if birds_per_day[i] == 0
    #         ok = true
    #         break
    #     end
    # end
    # return ok
end

function count_for_first_days(birds_per_day, num_days)
    return sum(birds_per_day[1:num_days])
    # sum = 0
    # for i = 1:num_days
    #     sum += birds_per_day[i]
    # end
    # return sum
end

function busy_days(birds_per_day) 
    return count(birds_per_day .>= 5)
    # cnt = 0
    # for i = 1:length(birds_per_day)
    #     if birds_per_day[i] >= 5
    #         cnt += 1
    #     end
    # end
    # return cnt
end

function average_per_day(week1, week2)
    return (week1 .+ week2) ./ 2
end
