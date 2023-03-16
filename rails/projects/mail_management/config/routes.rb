Rails.application.routes.draw do
  root 'users#index'
  post 'import_from_excel' => "users#import_from_excel"
end
