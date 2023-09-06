class GeneralShoppingListController < ApplicationController
  def index
    @user = current_user
    @recipes = current_user.recipes.joins(:recipe_foods).select('recipe_foods.*')


  end
end
