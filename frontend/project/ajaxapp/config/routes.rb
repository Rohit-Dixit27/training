Rails.application.routes.draw do
  root "users#index"
  get '/search', to: 'users#search', defaults: { format: 'js' }
end
