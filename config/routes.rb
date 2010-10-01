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

# ActionController::Routing::Routes.draw do |map|
#   map.resources :messages

#   map.logout '/logout', :controller => 'sessions', :action => 'destroy'
#   map.login '/login', :controller => 'sessions', :action => 'new'
#   map.register '/register', :controller => 'users', :action => 'create'
#   map.signup '/signup', :controller => 'users', :action => 'new'
#   map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  
#   map.resources :users

#   map.resource :session

#   map.root :controller => "splogna"

#   map.resources :needs, :gots, :tags

#   map.connect ':controller/:action/:id'
#   map.connect ':controller/:action/:id.:format'
# end
