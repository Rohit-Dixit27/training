Rails.application.routes.draw do
  root "books#index"
  #get 'books(/:id)', to: 'books#show'
  #get 'books/:id/:author_id', to: 'books#show'
  #get 'books/:id/with_author/:author_id', to: 'books#show'
  #get 'books/:id', to: 'books#show'
  #get '/:id', to:'books#show', constraints: { id: /\d+/ }
  get '/:id/*abc', to: 'books#show'
  resources :books, :authors
  

  #resources :books do
    #member do
    #  get 'display'
   # end
  #end
  #resources :books do
   # get 'display', on: :member
  #end
  

  #get 'books(/:id)', to: 'books#show'
  #resources :orders

  #resources :authors do
   # resources :books
  #end
  #shallow do
    #resources :authors do
    #  resources :books
    #  resources :orders
   # end
  #end
  # scope shallow_preifx: "sekret" do
   # resources :authors do
   #   resources :books, shallow: true
   # end
  #end
  #resources :authors do
    #resources :books do
    #  resources :orders
   # end
  #end
  #namespace :admin do
   # resources :images
  #end
  #scope module: 'admin' do
   #resources :images
  #end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
