Rails.application.routes.draw do
  resources :notes

  get '/cash_transactions/income', to: 'cash_transactions#new'
  post '/cash_transactions/income', to: 'cash_transactions#income'

  get '/cash_transactions/expence', to: 'cash_transactions#new'
  post '/cash_transactions/expence', to: 'cash_transactions#expence'

  get '/cash_transactions/choose_type', to: 'cash_transactions#choose_type'
  get '/cash_transactions/important_transaction', to: 'cash_transactions#important_transaction', as: 'important_transaction'
  resources :cash_transactions
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

  get '/finances/:id/finance_info', to: 'finance#finance_info', as: 'finance_info'
  post '/finances/:id/finance_info', to: 'finance#finance_info'

  get '/cash_transactions', to: 'cash_transactions#index'

  get '/cash_transactions/:id/edit', to: 'cash_transactions#edit'
  post '/cash_transactions/:id/edit', to: 'cash_transactions#update'

  get '/note/:id/show', to: 'notes#show', as: 'notes_show'
  get '/note/:id/edit', to: 'notes#edit'
  post '/note/:id/edit', to: 'notes#edit'
  get 'note/:id/new', to: 'notes#new'
  post 'note/:id/new', to: 'notes#create'

  get '/charts', to: 'charts#index'
  post '/charts', to: 'charts#index'

end
