# define the TreasureChest{T} type
struct TreasureChest{T}
    password::String
    treasure::T
end

function get_treasure(password_attempt, chest)
    if chest.password == password_attempt
        return chest.treasure
    else
        return nothing
    end
end 

function multiply_treasure(multiplier, chest)
    return TreasureChest(chest.password, [chest.treasure for i in 1:multiplier])
end
