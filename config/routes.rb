Rails.application.routes.draw do
  resources :shop, only: [:index] do
    collection do
      get :signin
      get :signup
    end
  end

  namespace :api do
    resources :users, only: [:create, :update] do
      collection do
        post :authenticate_user
      end
    end
  end

  resources :users, only: [:index] do
    # User session[:user]["user_id"] as user id
    member do
      get :profile
      get :orders
      get :addresses
    end
  end

  resources :admin, only: [:index] do
    collection do
      get :dashboard
      get :orders
      get :products
    end
  end

  root "shop#index"
  get "signout" => "users#signout"
end
