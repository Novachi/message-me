# frozen_string_literal: true

Rails.application.routes.draw do
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#sign_in'

  resources :chatrooms

  root 'sessions#login'
end
