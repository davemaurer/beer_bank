Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/twitter', as: :login

  get '/auth/twitter/callback', to: 'sessions#create'

  get '/logout', as: :logout, to: 'sessions#destroy'

  resources :users, except: [:destroy]

  resources :beers
end
