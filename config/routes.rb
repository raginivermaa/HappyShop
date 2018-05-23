Rails.application.routes.draw do
  resources :variants
  resources :products
  resources :categories
  resources :product_searches
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #get "categories", to: "categories#index"
  #get "products", to: "products#index"
  #get "variants", to: "variants#index"

  #get "categories/:id", to: "categories#show"
  #get "products/:id", to: "products#show"
  #get "variants/:id", to: "variants#show"
  # get ...., to ..
  # post ... to ...
  # put ... to ..
  # delete ... to...

  get "categories/*id", to: 'categories#show'

  #api
  namespace 'api' do
    namespace 'v1' do
      resources :categories
    end
  end


  namespace 'api' do
    namespace 'v1' do
      resources :products
    end
  end

  get "api/v1/categories/*id", to: 'api/v1/categories#show'



end
