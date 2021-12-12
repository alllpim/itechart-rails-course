Rails.application.routes.draw do
  resources :finances
  resources :people
  get 'home/index'
  devise_for :users
  get 'people/profile'
  root 'home#index'
  get 'people/profile', as: 'user_root'
end
