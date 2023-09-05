class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show; end

  def create
    @recipe = Recipe.new

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def new
    @recipe = Recipe.new
  end

  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
    end
  end

end
