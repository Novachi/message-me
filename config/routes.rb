# frozen_string_literal: true

Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/register', to: 'users#new'

  resources :chatrooms, only: %i[index show]
  resources :messages, only: %i[create]
  resources :users, only: %i[create] do
    resources :friend_requests, only: %i[index new create destroy] do
      get '/accept', to: 'friend_requests#accept'
    end
  end

  mount ActionCable.server, at: '/cable'

  root 'chatrooms#index'
end
