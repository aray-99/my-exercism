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
    side_max = 0
    set_max = Set{Plot}()
    for plot in register
        side = get_longest_side(plot)
        if side_max == side
            push!(set_max, plot)
        elseif side_max < side
            side_max = side
            set_max = Set{Plot}([plot])
        end
    end
    return set_max
end
