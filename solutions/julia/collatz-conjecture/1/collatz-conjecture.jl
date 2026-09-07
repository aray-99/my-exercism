function collatz_steps(n)
    if n < 1
        throw(DomainError(n))
    end
    
    steps = 0
    num = n
    while (n > 1)
        if n % 2 == 0
            n = round(n / 2)
        else
            n = 3n + 1
        end
        steps += 1
    end
    return steps
end
