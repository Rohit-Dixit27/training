Rails.application.routes.draw do
  get "about", to: "about#index"
  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"
  delete "logout", to: "sessions#destroy"
  root "main#index"
end
