Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/twitter', as: :login

  get '/auth/twitter/callback', to: 'sessions#create'

  resources :users, except: [:destroy]

  resources :beers

  resources :lists
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  #   resources :products

  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
