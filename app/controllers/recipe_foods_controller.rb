class RecipeFoodsController < ApplicationController
    def destroy
        @recipe_food = RecipeFood.find(params[:id])
        @recipe_food.destroy
        redirect_back_or_to root_path, notice: 'The recipe food was successfully removed.'
    end
end
