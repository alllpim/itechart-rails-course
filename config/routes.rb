Rails.application.routes.draw do
  resources :transactions
  get 'errors/not_found'
  resources :finance
  resources :people
  get 'home/index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'home#index'

  get '/404', to: 'errors#not_found'

  post '/people/new', to: 'people#create'
  post '/people/:id/edit', to: 'people#update'

  get '/finances', to: 'finance#index'

  get '/finance/:id/edit', to: 'finance#edit'
  post '/finance/:id/edit', to: 'finance#update'

  get '/finance/new', to: 'finance#new'
  post '/finance/new', to: 'finance#create'

  get '/people/:id/finances', to: 'people#persons_finances', as: 'people_persons_finances'

  get '/finances/:id', to: 'finance#finance_info', as: 'finance_info'
  post '/finances/:id', to: 'finance#finance_info'

  get '/transactions', to: 'transactions#index'

  get '/transactions/new', to: 'transactions#new'
  post '/transactions/new', to: 'transactions#create'

  get '/transactions/:id/edit', to: 'transactions#edit'
  post '/transactions/:id/edit', to: 'transactions#update'

end
