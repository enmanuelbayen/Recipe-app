require 'rails_helper'

RSpec.describe 'recipes/show', type: :system do
  let!(:user) do
    user = User.create(name: 'John', email: 'jhon@gmail.com', password: 'password', password_confirmation: 'password')
  end

  let!(:recipe) do
    Recipe.create(name: 'Apple Pie', preparation_time: 30, cooking_time: 60, description: 'Delicious apple pie recipe', user_id: user, public: true)
  end

  before do
    login_as(user, scope: :user)
    visit recipes_path
  end

  it 'displays the recipe name' do
    expect(page).to have_css('h1', text: 'Recipes')
  end

  it 'displays the preparation time' do
    expect(page).to have_content('Preparation time: 30 hours')
  end

  it 'displays the cooking time' do
    expect(page).to have_content('Cooking time: 60 hours')
  end

  it 'displays the recipe description' do
    expect(page).to have_content('Delicious apple pie recipe')
  end

  it 'displays the "Generate Shopping List" button for authorized users' do
    expect(page).to have_link('Generate Shopping List', href: url_for(action: 'index', controller: 'general_shopping_list'))
  end

  it 'displays the "Add Ingredient" button for authorized users' do
    expect(page).to have_link('Add Ingredient', href: new_recipe_recipe_food_path(recipe))
  end

  it 'displays the table headers' do
    expect(page).to have_content('Food')
    expect(page).to have_content('Measurement Unit')
    expect(page).to have_content('Quantity')
    expect(page).to have_content('Value')
    expect(page).to have_content('Actions')
  end

  it 'renders the recipe foods in the table' do
    recipe.recipe_foods.each do |recipe_food|
      expect(page).to have_content(recipe_food.food)
      expect(page).to have_content(recipe_food.measurement_unit)
      expect(page).to have_content(recipe_food.quantity)
      expect(page).to have_content(recipe_food.value)
    end
  end
end