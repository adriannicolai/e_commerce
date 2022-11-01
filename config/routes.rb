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

  root "shop#index"
  get "signout" => "users#signout"
end
