Rails.application.routes.draw do
  root to: "users#index"
  devise_for :users

  resources :posts, except: :index
  resources :users, only: :show
end
