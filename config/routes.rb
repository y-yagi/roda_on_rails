require_relative "../lib/app"

Rails.application.routes.draw do
  resources :users
  # mount App => "/"
end
