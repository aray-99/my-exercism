function shift_back(value, amount)
    return value >>> amount
    # cnt = 0
    # for iter=1:amount
    #     value = value >>> 1
    # end
    # return value
end

function set_bits(value, mask)
    return value | mask
    # digit = 0
    # ans = value
    # while (max(value, mask) != 0)
    #     if value % 2 == 0
    #         ans += mask % 2 * 2^digit
    #     end
    #     value = value >> 1
    #     mask = mask >> 1
    #     digit += 1
    # end
    # return ans
end

function flip_bits(value, mask)
    return xor(value, mask)
    # digit = 0
    # ans = 0
    # while (max(value, mask) != 0)
    #     v = value % 2 == 1
    #     m = mask % 2 == 1
    #     if m
    #         ans += Int(!v) * 2^digit
    #     else
    #         ans += Int(v) * 2^digit
    #     end
    #     value = value >> 1
    #     mask = mask >> 1
    #     digit += 1
    # end
    # return ans
end

function clear_bits(value, mask)
    return value & ~mask
    # digit = 0
    # ans = 0
    # while (max(value, mask) != 0)
    #     v = value % 2 == 1
    #     m = mask % 2 == 1
    #     ans += Int(!m & v) * 2^digit
    #     value = value >> 1
    #     mask = mask >> 1
    #     digit += 1
    # end
    # return ans
end
