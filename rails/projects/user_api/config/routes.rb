Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :comments
      end
    end
  end
end
