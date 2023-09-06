class RecipesController < ApplicationController
  def index; end

  def show
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    
    if @recipe.update(update_public_recipe_params)
      flash[:notice] = 'This recipe public state has been updated'
      redirect_to @recipe
    else
      flash[:alert] = 'Failed to update the public state of this recipe'
      redirect_to @recipe
    end
  end

  def create; end

  def new; end

  def destroy; end

  private

  def update_public_recipe_params
    params.require(:recipe).permit(:public) # Asegúrate de incluir otros atributos si es necesario
  end
end
