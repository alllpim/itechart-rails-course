Rails.application.routes.draw do
  resources :finance
  resources :people
  get 'home/index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  get '/people/:id/finances', to: 'people#persons_finances'

  post '/people/new', to: 'people#create'
  post '/people/:id/edit', to: 'people#update'

  root 'home#index'

  get '/finances', to: 'finance#index'

  get '/finance/:id/edit', to: 'finance#edit'
  post '/finance/:id/edit', to: 'finance#update'

  get '/finance/new', to: 'finance#new'
  post '/finance/new', to: 'finance#create'

end
