Rails.application.routes.draw do
  devise_for :users
  resources :shops, only: [:index]

  root to: "shops#index"
end
