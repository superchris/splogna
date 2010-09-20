Splogna::Application.routes.draw do
  resources :messages
  match '/logout' => 'sessions#destroy', :as => :logout
  match '/login' => 'sessions#new', :as => :login
  match '/register' => 'users#create', :as => :register
  match '/signup' => 'users#new', :as => :signup
  match '/activate/:activation_code' => 'users#activate', :as => :activate
  resources :users
  resource :session
  match '/' => 'splogna#index'
  resources :needs
  resources :gots
  resources :tags
  match '/:controller(/:action(/:id))'
end

