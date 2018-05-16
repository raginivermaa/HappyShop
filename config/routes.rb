Rails.application.routes.draw do
  resources :variants
  resources :products
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #get "categories", to: "categories#index"
  #get "products", to: "products#index"
  #get "variants", to: "variants#index"

  #get "categories/:id", to: "categories#show"
  #get "products/:id", to: "products#show"
  #get "variants/:id", to: "variants#show"



end
