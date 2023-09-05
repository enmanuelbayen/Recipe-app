class RecipesController < ApplicationController
  def index; end

  def show
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
  end

  def create; end

  def new; end

  def destroy; end
end
