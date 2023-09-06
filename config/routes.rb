Rails.application.routes.draw do
    resources :foods, only: [:index, :create, :new, :destroy]
    resources :recipes, only: [:index, :show, :create, :new, :destroy]
    resources :general_shopping_list, only: [:index]
    get '/public_recipes', to: 'recipes#public_recipes'
    
    root 'foods#index'
end
