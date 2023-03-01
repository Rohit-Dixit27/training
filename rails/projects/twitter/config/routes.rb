Rails.application.routes.draw do
  resources :inboxes do
    resources :messages
  end
  root 'inboxes#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
