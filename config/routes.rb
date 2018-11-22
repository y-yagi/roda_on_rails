require_relative "../lib/app"

Rails.application.routes.draw do
  # post "/graphql", to: "graphql#execute"
  # resources :users, path: "/api/users"
  mount App.freeze.app => "/"
end
