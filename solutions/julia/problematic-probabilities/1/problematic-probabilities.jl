function rationalize(successes, trials)
    return successes .// trials
end

function probabilities(successes, trials)
    successes ./ trials
end

function checkmean(successes, trials)
    avg_rational = sum(rationalize(successes, trials)) / length(trials)
    avg_float = sum(probabilities(successes, trials)) / length(trials)
    if avg_float == float(avg_rational)
        return true
    else
        return avg_rational
    end
end

function checkprob(successes, trials)
    mul_rational = prod(rationalize(successes, trials))
    mul_float = prod(probabilities(successes, trials))
    if mul_float == float(mul_rational)
        return true
    else
        return mul_rational
    end
end
