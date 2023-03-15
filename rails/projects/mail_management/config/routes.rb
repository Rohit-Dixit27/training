Rails.application.routes.draw do
  root 'users#index'
  resources :users
  post 'import_from_excel' => "users#import_from_excel"
end
