# frozen_string_literal: true

Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :chatrooms
  resources :messages, only: %i[create]

  mount ActionCable.server, at: '/cable'

  root 'chatrooms#index'
end
