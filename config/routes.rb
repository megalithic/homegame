Homegame::Application.routes.draw do
  resources :players
  resources :sessions
  resources :games
  resources :votes
  resources :about
  root :to => "main#index"
  get "about" => "about#index", :as => "about"
  match '/about', to: 'about#index'
  match '/register', to: 'players#new'
  match '/login', to: 'sessions#new'
  match '/logout', to: 'sessions#destroy'
end
