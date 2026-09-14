function clean_ingredients(dish_name, dish_ingredients)
    return (dish_name, Set(dish_ingredients))
end

function check_drinks(drink_name, drink_ingredients)
    type = isdisjoint(drink_ingredients, ALCOHOLS) ? "Mocktail" : "Cocktail"
    return "$(drink_name) $(type)"
end

function categorize_dish(dish_name, dish_ingredients)
    categories = (
        ("VEGAN", VEGAN),
        ("VEGETARIAN", VEGETARIAN),
        ("PALEO", PALEO),
        ("KETO", KETO),
        ("OMNIVORE", OMNIVORE)
    )
    
    for (name, set_data) in categories
        if issubset(dish_ingredients, set_data)
            return "$(dish_name): $(name)"
        end
    end
end

function tag_special_ingredients(dish)
    return (dish[1], Set(intersect(dish[2], SPECIAL_INGREDIENTS)))
end

function compile_ingredients(dishes)
    return union(dishes...)
end

function separate_appetizers(dishes, appetizers)
    return setdiff(dishes, appetizers)
end

function singleton_ingredients(dishes, intersection)
    compiled = compile_ingredients(dishes)
    return setdiff(compiled, intersection)
end
