Rails.application.routes.draw do
  root to: 'sessions#new'
  get '/signup', to: 'users#new'
  get '/users', to: 'users#show'
  get '/login', to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/logout',  to: 'sessions#destroy'
  get '/map', to: 'map#index'
  post '/shopreview', to: 'shopreview#create'
  delete '/shopreview/:id', to: 'shopreview#destroy'
  get '/shops/:id', to: 'shops#show'
  resources :users
  resources :shops

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
