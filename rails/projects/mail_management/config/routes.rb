Rails.application.routes.draw do
  devise_for :admins
  root 'users#index'
  post 'import_from_excel' => "users#import_from_excel"
  get '/search', to: 'users#search'
end
