Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :products, only: %i[index], defaults: { format: :json }
  resources :carts, only: %i[index create], defaults: { format: :json }
end
