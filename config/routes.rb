Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  defaults format: :json do
    resources :products, only: %i[index]
    resources :carts, only: %i[index create] do
      resources :products, only: %i[create update destroy], controller: 'cart_products'
    end
  end
end
