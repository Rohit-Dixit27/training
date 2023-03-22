require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  root 'users#index'
  post 'import_from_excel' => "users#import_from_excel"
  get '/search', to: 'users#search'

  resources :users do
    delete 'destroy_multiple', on: :collection
  end
end
