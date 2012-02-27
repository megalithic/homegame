Homegame::Application.routes.draw do
  root :to => "main#index"

  match "/about", to: "about#index", :as => "about"
  match '/unvote/:id', to: 'votes#update', :via => :put, :as => "unvote"
  match '/about', to: 'about#index'
  match '/register', to: 'players#new'
  match '/login', to: 'sessions#new'
  match '/logout', to: 'sessions#destroy'

  resources :players
  resources :sessions
  resources :games
  resources :votes
  resources :about
end
