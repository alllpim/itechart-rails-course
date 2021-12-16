Rails.application.routes.draw do
  resources :finances
  resources :people
  get 'home/index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  post '/people/new', to: 'people#create'
  post '/people/:id/edit', to: 'people#update'

  #get 'person/:id'
  root 'home#index'
  #get 'person/:id', as: 'user_root'
end
