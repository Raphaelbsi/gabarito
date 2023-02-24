# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, :evidences, :questions
  post '/login', to: 'users#login'
end
