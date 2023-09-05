class RecipesController < ApplicationController
  def index; end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create; end

  def new; end

  def destroy; end
end
