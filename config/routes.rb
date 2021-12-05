Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  get 'persons/profile'
  root 'home#index'
  get 'persons/profile', as: 'user_root'
end
