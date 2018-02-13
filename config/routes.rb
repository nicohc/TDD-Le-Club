Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#home'
  resources :users
=begin
  get '/users/new', to: "users#new"
  post '/users/new', to: "users#create"

  get '/users/show', to: "users#show"

  get '/users/edit', to: "users#edit"
    post '/users/edit', to: "users#update"

  get '/users', to:'users#index'
=end 
  get '/login',      to: "sessions#new"
  post '/login',     to: "sessions#create"
  delete '/logout',  to: "sessions#destroy"

end
