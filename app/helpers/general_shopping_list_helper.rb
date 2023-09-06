module GeneralShoppingListHelper
    def generate_missing_foods(user, recipe_foods)
        user_foods = user.foods
        user_recipe_foods = recipe_foods.group_by(&:food_id).transform_values { |foods| foods.sum(&:quantity) }

        p user_recipe_foods
    
        missing_foods = []
    
        user_recipe_foods.each do |food_id, recipe_food_quantity|
            user_food = user_foods.find_by(id: food_id)
            if user_food && user_food.quantity < recipe_food_quantity
              missing_foods << {
                food: user_food,
                quantity_remaining: recipe_food_quantity - user_food.quantity
              }
            end
        end
    
        missing_foods
    end
end
