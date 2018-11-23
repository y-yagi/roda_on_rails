require_relative "../lib/app"

Rails.application.routes.draw do
  get '/dummy', to: 'dummy#index'
  post "/graphql", to: "graphql#execute"
  resources :users, path: "/api/users"
  mount App.freeze.app => "/roda"
end
