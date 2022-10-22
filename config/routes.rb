Rails.application.routes.draw do
  resources :shop, only: [:index]

  namespace :shop do

  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "shop#index"
end
