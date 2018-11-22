require_relative "../lib/app"

Rails.application.routes.draw do
  # resources :users, path: "/api/users"
  mount App.freeze.app => "/"
end
