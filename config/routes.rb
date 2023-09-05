Rails.application.routes.draw do
    resources :foods
    resources :recipes, only: [:index, :show, :new, :create, :destroy] do
      resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
    end 
    resources :public_recipes, only: [:index]
    resources :general_shopping_list, only: [:index]

    root 'foods#index'
end
