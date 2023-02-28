Rails.application.routes.draw do
  root "books#index"
  resources :books

  #namespace :admin do
   # resources :images
  #end
  scope module: 'admin' do
   resources :images
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
