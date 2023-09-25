Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  
  resources :roots#, only: :index
  resources :admins#, only: :index
  resources :customers#, only: :index
end
