function raindrops(number)
    ret = ""
    if number % 3 == 0
        ret *= "Pling"
    end
    if number % 5 == 0
        ret *= "Plang"
    end
    if number % 7 == 0
        ret *= "Plong"
    end
    if ret == ""
        ret = string(number)
    end
    return ret
end
