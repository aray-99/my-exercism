# define the Coord type
struct Coord
    x::UInt16
    y::UInt16
end

# define the Plot keyword type
@kwdef struct Plot
    bottom_left::Coord
    top_right::Coord
end

function is_claim_staked(claim::Plot, register::Set{Plot})
    return claim in register
end

function stake_claim!(claim::Plot, register::Set{Plot})
    if is_claim_staked(claim, register)
        return false
    else
        push!(register, claim)
        return true
    end
end

function get_longest_side(claim::Plot)
    w = claim.top_right.x - claim.bottom_left.x
    h = claim.top_right.y - claim.bottom_left.y
    return max(w, h)
end

function get_claim_with_longest_side(register::Set{Plot})
    # array_register = collect(register)
    length_max = 0
    set_max = Set{Plot}()
    # for i in 1:length(array_register)
    #     l = get_longest_side(array_register[i])
    #     if length_max == l
    #         push!(set_max, array_register[i])
    #     elseif length_max < l
    #         length_max = l
    #         set_max = Set{Plot}([array_register[i]])
    #     end
    # end
    # return set_max
    for plot in register
        side = get_longest_side(plot)
        len = get_longest_side(plot)
        if length_max == len
            push!(set_max, plot)
        elseif length_max < len
            length_max = len
            set_max = Set{Plot}(plot)
        end
    end
    return set_max
end
