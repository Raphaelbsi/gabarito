# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, :evidences
  post '/login', to: 'users#login'
end
