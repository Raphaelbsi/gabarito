# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, :evidences, :questions, :alternatives, :answers
  post '/login', to: 'users#login'
end
